#!/bin/bash

GIT_PATH=`which git`
CURL_PATH=`which curl`

PROJECT_PATH=$1
PROJECT_NAME=$2

if [ -z "$GIT_PATH" ]; then
    echo "Please check if your system has Git instaled."
    exit 1;
else
    echo "Git found at: '$GIT_PATH'"
fi

if [ -z "$CURL_PATH" ]; then
    echo "Please check if your system has curl instaled."
    exit 1;
else
    echo "curl found at: '$CURL_PATH'"
fi

echo "Starting Python project '$PROJECT_NAME' at: '$PROJECT_PATH'"

if [ ! -e "$PROJECT_PATH" ]; then
    echo "Project path '$PROJECT_PATH' does not exists."
    exit 1;
fi

PROJECT_FULL_PATH="$PROJECT_PATH/$PROJECT_NAME"

if [ ! -e "$PROJECT_FULL_PATH" ]; then
    mkdir $PROJECT_FULL_PATH
    echo "Project directory created at: '$PROJECT_FULL_PATH'"
else
    echo "The path '$PROJECT_FULL_PATH' alread exists. I do not proceed due to avoid some damage."
    exit 1
fi

cd $PROJECT_FULL_PATH

git init

touch README.md

curl --url "https://www.gitignore.io/api/git,osx,linux,python,windows,textmate,notepadpp,pycharm+all,sublimetext,visualstudiocode,jupyternotebooks" > .gitignore

git add .

git commit -m "'$PROJECT_NAME' initial commit."

git branch develop

echo "Project stated. Now create the remote repository to push your work."

ls -lah $PROJECT_FULL_PATH

exit 0