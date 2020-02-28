
import bottle # server
import json
import collections
import sys
import re
import os
import string
import tqdm # progress bar
import urllib # quote url (%..)
import timeit

# Files
def build_file_list(is_nice_path=lambda p: True):
    # for root, dirs, files in os.walk(".", topdown=False):
    #     for name in files:
    #         path = os.path.join(root, name)
    #         if is_nice_path(path):
    #             yield path
    base_path = os.getcwd()
    with open('all.txt') as files:
        for path in files.read().splitlines():
            if is_nice_path(path):
                if path.startswith('./'):
                    yield os.path.join(base_path, path.lstrip('./'))
                else:
                    yield path

# Lines
class OrderedList:
    def __init__(self):
        self.entries = []

    def add(self, key, value):
        reorder = self.entries and key < self.entries[-1][0]
        self.entries.append( (key, value) )
        if reorder:
            self.entries = sorted(self.entries, key=lambda d: d[0])

    def find_lower(self, i):
        a = 0
        b = len(self.entries) - 1
        m = (a+b)//2
        while a < b :
            if i >= self.entries[m][0] and i < self.entries[m + 1][0]:
                return self.entries[m]
            elif self.entries[m][0] > i :
                b = m-1
            else :
                a = m+1
            m = (a+b)//2
        return self.entries[a]

def build_lines(s):
    lines = OrderedList()
    lines.add(0,0)
    n = 0
    i = s.find('\n', 0)
    while i != -1:
        n += 1
        lines.add(i,n)
        i = s.find('\n', i + 1)
    lines.add(len(s), -1)
    return lines

def get_line(i, s, lines):
    line_start, line_nb = lines.find_lower(i)
    line_content = s[line_start + 1: s.find('\n', line_start + 1)]
    return (line_nb + 1, line_content)

# Contents
class Content:
    def __init__(self, s):
        self.s = s
        self.lines = build_lines(s)

    def get_lines(self, pattern):
        found_lines = set()
        for m in re.finditer(pattern, self.s):
            line_nb, line_content = get_line(m.start(), self.s, self.lines)
            if line_nb not in found_lines:
                found_lines.add(line_nb)
                yield (line_nb, line_content)

def build_content(path):
    with open(path, 'rb') as content_file:
        try:
            return Content( content_file.read().decode('utf-8', 'ignore') )
        except Exception as err:
            print("ERROR: cannot read file", path)
            raise err

# Cache
class Cache:
    def __init__(self):
        self.entries = []

    def register(self, path, content):
        self.entries.append( self.ContentEntry(path, content) )

    class ContentEntry:
        def __init__(self, path, content):
            self.path = path
            self.content = content

            # pre computed
            self.dir = os.path.dirname(path)
            self.ext = os.path.splitext(path)[1]
            self.name = os.path.splitext( os.path.basename(path) )[0]

def build_cache(files):
    cache = Cache()
    for path in tqdm.tqdm(files, unit='file', ncols=80):
        if os.path.isfile(path):
            content = build_content(path)
            cache.register(path, content)
    return cache

# Queries on cache
def build_is_filters(params):
    return [ (re.compile(v), k == "is") for k, v in params if k.startswith("is") ]

def build_has_filters(params):
    return [ (re.compile(v), k == "has") for k, v in params if k.startswith("has") ]

def get_printable_filters(filters):
    def get_printable_filter(regex, is_white):
        return "{}'{}'".format( "+" if is_white else "-", regex.pattern)

    return " | ".join([get_printable_filter(regex, is_white) for regex, is_white in filters])

def is_matching(s, filters):
    for pattern, is_white in filters:
        if pattern.search(s):
            if not is_white:
                return False
        else:
            if is_white:
                return False
    return True

def get_contents(cache, is_filters):
    if is_filters:
        return [(e.path, e.content) for e in cache.entries if is_matching(e.path, is_filters)]
    else:
        return [(e.path, e.content) for e in cache.entries]

def get_lines(contents, has_filters):
    for path, content in contents:
        first_pattern, _ = has_filters[0]
        for line_nb, line_content in content.get_lines(first_pattern):
            if len(has_filters) == 1 or is_matching(line_content, has_filters[1:]):
                yield (path, line_nb, line_content)

# Services
def find_lines(cached_files, filters):
    is_filters, has_filters = filters

    if not has_filters:
        print("ERROR: no line filter")
        return

    contents = get_contents(cache, is_filters)
    print("Scanning {} contents ..".format( len(contents) ))

    def clean(s):
        return ''.join(filter(lambda c: c in string.printable, s)).rstrip('\r')

    for path, line_nb, line_content in get_lines(contents, has_filters):
        yield { 'file': path,
                'line': line_nb,
                'content': clean(line_content) }

def find_files(cached_files, filters):
    is_filters, has_filters = filters
    contents = get_contents(cache, is_filters)
    print("Scanning {} contents ..".format( len(contents) ))

    if has_filters:
        known_paths = set()
        for path, _, _ in get_lines(contents, has_filters):
            if path not in known_paths:
                known_paths.add(path)
                yield { 'file': path,
                        'line': 1,
                        'content': "<<File>>" }
    else:
        for path, _ in contents:
            yield { 'file': path,
                    'line': 1,
                    'content': "<<File>>" }

# Bottle
print("Selecting files ..")
def is_nice(path):
    # return path.endswith(".cpp") or path.endswith(".hpp") or path.endswith(".html") or path.endswith(".xml")
    return path.endswith(".cpp") or path.endswith(".hpp") or path.endswith(".h") or path.endswith(".c") or path.endswith(".xml")
files = list( build_file_list(is_nice) )
print(" Found {} files".format( len(files) ))

print("Building in-memory cache ..")
cache = build_cache(files)
print()

def build_params(s):
    params = []
    for field in s.split('&'):
        data = field.split('=')
        params.append( (data[0], data[1]) )
    return params

def build_filters(s):
    print(" request: {}".format(s))

    params = build_params(s)
    print(" params: {}".format(params))

    is_filters = build_is_filters(params)
    print(" is: {}".format( get_printable_filters(is_filters) ))
    has_filters = build_has_filters(params)
    print(" has: {}".format( get_printable_filters(has_filters) ))

    return (is_filters, has_filters)

def clean_url(url):
    print(" url: {}".format(url))
    return urllib.parse.unquote(url)

@bottle.get('/line')
def interface_find_line():
    start = timeit.default_timer()

    print("Decoding request ..")
    filters = build_filters( clean_url(bottle.request.query_string) )
    lines = list(find_lines(cache, filters))
    print("Found {} lines".format( len(lines) ))

    end = timeit.default_timer()
    print("Search completed in {0:.3f}s".format(end - start))
    print()

    bottle.response.headers['Content-Type'] = 'application/json'
    bottle.response.headers['Cache-Control'] = 'no-cache'
    return json.dumps(lines)

@bottle.get('/file')
def interface_find_file():
    start = timeit.default_timer()

    print("Decoding request ..")
    filters = build_filters( clean_url(bottle.request.query_string) )
    files = list(find_files(cache, filters))
    print("Found {} files".format( len(files) ))

    end = timeit.default_timer()
    print("Search completed in {0:.3f}s".format(end - start))
    print()

    bottle.response.headers['Content-Type'] = 'application/json'
    bottle.response.headers['Cache-Control'] = 'no-cache'
    return json.dumps(files)

@bottle.get('/all')
def interface_find_all():
    start = timeit.default_timer()

    print("Decoding request ..")
    filters = build_filters( clean_url(bottle.request.query_string) )

    file_is_filters = filters[0] + filters[1]
    print(" file is: {}".format(file_is_filters))

    files = list( find_files(cache, (file_is_filters, [])) )
    lines = list( find_lines(cache, filters) )
    print("Found {} files and {} lines".format( len(files), len(lines) ))

    end = timeit.default_timer()
    print("Search completed in {0:.3f}s".format(end - start))
    print()

    bottle.response.headers['Content-Type'] = 'application/json'
    bottle.response.headers['Cache-Control'] = 'no-cache'
    return json.dumps(files + lines)

app = application = bottle.default_app()

if __name__ == '__main__':
   bottle.run(host = '127.0.0.1', port = 8880)

