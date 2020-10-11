#!/usr/bin/env bash

GIT_PATH=`which git`
CURL_PATH=`which curl`

PROJECT_PATH=$1
PROJECT_NAME=$2

if [ -z "$GIT_PATH" ]; then
    echo "Please check if your system has Git installed."
    exit 1;
else
    echo "Git found at: '$GIT_PATH'"
fi

if [ -z "$CURL_PATH" ]; then
    echo "Please check if your system has curl installed."
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
    echo "The path '$PROJECT_FULL_PATH' alread exists. I can't proceed due to avoid some damage."
    exit 1
fi

cd $PROJECT_FULL_PATH

git init

echo "### ${PROJECT_NAME}" > README.md

curl -L --url "https://www.gitignore.io/api/osx,git,linux,flask,django,python,windows,textmate,notepadpp,sublimetext,pycharm+all,jupyternotebooks,visualstudiocode" > .gitignore

mkdir $PROJECT_NAME

touch "$PROJECT_FULL_PATH/$PROJECT_NAME/.gitkeep"

mkdir "tests"

touch "$PROJECT_FULL_PATH/tests/.gitkeep"

git add .

git commit -m "'$PROJECT_NAME' initial commit."

git branch develop

echo "Project started. Now, create the remote repository to push your work."

ls -lah $PROJECT_FULL_PATH

exit 0