#!/bin/zsh

PWD=$(pwd)
LIBRARY_SNIPPETS_DIR="$HOME/Library/Developer/Xcode/UserData/CodeSnippets"

if [ ! -f "$PWD"/install.sh ]; then 
    echo "Error: run install.sh in git directory xcode-snippets"
    exit 1
fi

if [ -d "$LIBRARY_SNIPPETS_DIR" ]; then
    if [ ! -L "$LIBRARY_SNIPPETS_DIR" ]; then
        echo "'$LIBRARY_SNIPPETS_DIR' found and now copying files, please wait ..."
        cp "$LIBRARY_SNIPPETS_DIR"/*.codesnippet ./CodeSnippets
        echo "Backup done !"
        echo "Remove directory '$LIBRARY_SNIPPETS_DIR', please wait ..."
        rm -Rf "$LIBRARY_SNIPPETS_DIR"
    else
        echo "'$LIBRARY_SNIPPETS_DIR' found but it's symbolic link"
        exit 1
    fi
fi

ln -s "$PWD"/CodeSnippets "$LIBRARY_SNIPPETS_DIR"

echo "Install completed! 🚀"
echo "Restart Xcode"

