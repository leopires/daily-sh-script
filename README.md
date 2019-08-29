## My daily shell scripts.

### start-python-project.sh
This script creates a simple Python project with Git. It creates one **.gitignore** file with the ignore rules for Python projects using https://gitignore.io and an empty **README.md** file.

To use this script:

chmod +x start-python-project.sh

./start-python-project.sh "<project_path>" "<project_name>"

It will init the git repository at: project_path/project_name. Example: **./start-python-project.sh "/Users/leonardo" "my-py-project"** creates the "my-py-project" folder at "/Users/leonardo".
