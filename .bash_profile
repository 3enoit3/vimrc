# Load default settings
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Alias
if [ -f ~/my_alias.sh ]; then
    . ~/my_alias.sh

    alias my_alias='vi ~/my_alias.sh && source ~/my_alias.sh'
fi

# Set bash as default shell for user: "sudo chsh --shell /bin/bash $USER"
