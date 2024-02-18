
# Student Record Retrieval System

This repository provides a rails application that retrieves the student record by either ID or the home page which shows all the students.
Along with this, you can perform the full CRUD in this application. The demo will be given at the end.
Here's the live site URL:
https://students-retrieval-system.onrender.com/


## Tech Stack

**Client:** HTML, ERB, CSS

**Server:** Ruby on Rails

**Database:** SQLite, as it can be used with minimum to no configuration. Hence best for the scope of this system.

**Machine:** Ubuntu or WSL (Windows Subsystem for Linux)
## Install Prerequisites

```bash
sudo apt-get update
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev
```

**Install Ruby Version Manager**
```bash
git clone https://github.com/excid3/asdf.git ~/.asdf
echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc
echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc
echo 'legacy_version_file = yes' >> ~/.asdfrc
echo 'export EDITOR="code --wait"' >> ~/.bashrc
exec $SHELL

asdf plugin add ruby
```

**Install Ruby**
```bash
asdf install ruby 3.1.4
```
## Run Locally

**Clone the project**

```bash
git clone https://github.com/chahmedejaz/students-retrieval-system.git
```

**Go to the project directory**

```bash
cd students-retrieval-system
```

**Install dependencies and migrate the database**

```bash
bin/setup
```

**Seed the database**

```bash
bundle exec rails db:seed
```

**Start the server**

```bash
bundle exec rails server
```

Go to ```http://localhost:3000/``` to access the application.
## Screenshots/Demo
Live site demo:

https://github.com/chahmedejaz/students-retrieval-system/assets/59338032/0a5c1aa1-22f9-48a7-83c5-8fbe265df1ba

This is the home page of the system:
![image](https://github.com/chahmedejaz/students-retrieval-system/assets/59338032/b369ee63-2b6a-4a07-be88-a22ce18d4e63)
It shows all of the students present in the database and displays them in tabular format.

Upon clicking the `view` link of any student, the system redirects you to the view page where the course details are being displayed as well:
![image](https://github.com/chahmedejaz/students-retrieval-system/assets/59338032/33ad7aca-def7-4f16-9a7a-0b2dcd6da099)

Note the URL, it is querying the student by the ID (1):
![image](https://github.com/chahmedejaz/students-retrieval-system/assets/59338032/3d3f31c4-4b80-45ba-a6f1-ba709123ba0a)

Upon querying the student with the wrong ID, then the system handles the error as well:

https://github.com/chahmedejaz/students-retrieval-system/assets/59338032/d2cfbcec-d5da-4599-b88c-9ba0dfcddfa9

Apart from webpages, the system is also capable of handling JSON API requests as well:
![image](https://github.com/chahmedejaz/students-retrieval-system/assets/59338032/68f7ee10-84ba-4d47-babf-e1ebde56b4e8)

![image](https://github.com/chahmedejaz/students-retrieval-system/assets/59338032/81c28178-2a24-4133-90cd-d6636f748f72)


