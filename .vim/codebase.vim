
python << EOF
import vim
import requests

def groupStreams(params):
    stream = []
    for p in params:
        if p == "|":
            yield stream
            stream = []
        else:
            stream.append(p)
    yield stream

def buildUrl(params):
    service = "file"
    if params[0] in ["C", "Co", "Code"]:
        service = "line"
    elif params[0] in ["All"]:
        service = "all"

    query = []
    for s in groupStreams(params):
        if s[0] in ["C", "Co", "Code", "All"]:
            for f in s[1:]:
                if f.startswith("-"):
                    query.append( "hasnot={}".format(f.lstrip("-")) )
                else:
                    query.append( "has={}".format(f.lstrip("+")) )
        elif s[0] in ["F", "Fi", "File"]:
            for f in s[1:]:
                if f.startswith("-"):
                    query.append( "isnot={}".format(f.lstrip("-")) )
                else:
                    query.append( "is={}".format(f.lstrip("+")) )
        else:
            pass # ignore stream
    return "{}?{}".format( service, "&".join(query) )

def callServer(url):
    resp = requests.get('http://127.0.0.1:8000/' + url)
    if resp.status_code != 200:
        print "Server error: {}".format(resp.status_code)
        return

    resp_json = resp.json()
    print "Found {} locations".format( len(resp_json) )

    locations = []
    for found in resp_json:
        locations.append({
        'filename': str(found["file"]),
        'lnum': found["line"],
        'text': str(found["content"]).replace("\'", "") if "content" in found else "" })
    return locations

def updateVim(locations):
    if not locations:
        return

    if len(locations) == 1:
        location = locations[0]
        path = location['filename']
        line_num = location['lnum']

        vim.command('cclose')
        vim.command('vi {}'.format(path))
        if line_num != 1:
            vim.command('{}'.format(line_num))
    else:
        vim.eval('setqflist({})'.format( repr(locations) ))
        vim.command('copen')

def pyCodeGrep(*params):
    url = buildUrl(["Code"] + list(params))
    locations = callServer(url)
    updateVim(locations)

def pyFileGrep(*params):
    url = buildUrl(["File"] + list(params))
    locations = callServer(url)
    updateVim(locations)

def pyAllGrep(*params):
    url = buildUrl(["All"] + list(params))
    locations = callServer(url)
    updateVim(locations)
EOF

