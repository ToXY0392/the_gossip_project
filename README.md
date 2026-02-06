# The Gossip Project – MVC Ruby Version

This project is a simple command-line application built in Ruby to practice the **Model–View–Controller (MVC)** architecture without using Rails.  
It allows users to create, list, and delete "gossips", which are stored in a CSV file.

---

## 📌 Features

- Add a new gossip (author + content)
- Display all saved gossips
- Delete a gossip by selecting its index
- Data is persisted in a CSV file (`db/gossip.csv`)
- Follows a full custom MVC structure:
  - **Model:** Data logic and CSV interactions  
  - **View:** Terminal input/output  
  - **Controller:** Coordinates user actions  
  - **Router:** Main application loop & menu

---

## 📂 Project Structure

```
├── 📁 db
│   └── 📄 gossip.csv
├── 📁 lib
│   ├── 💎 controller.rb
│   ├── 💎 gossip.rb
│   ├── 💎 router.rb
│   └── 💎 view.rb
├── 📄 Gemfile
├── 📝 README.md
└── 💎 app.rb
```





## 🧠 How It Works

### 1. Router  
- Displays the menu  
- Reads user input  
- Redirects to the correct controller action  

### 2. Controller  
- Calls the view to collect input  
- Creates Gossip objects  
- Interacts with the model  
- Sends results back to the view  

### 3. Model (`Gossip`)  
- Stores author and content  
- Saves data in `db/gossip.csv`  
- Loads all gossips via `.all`  
- Deletes a gossip by overwriting the CSV  

### 4. View  
- Displays menus and lists  
- Asks the user for input  
- Shows confirmations and error messages  



## ▶️ Running the Application

1. Install dependencies:

```bash
bundle install
```
Make sure the CSV file exists:

```bash
mkdir -p db
touch db/gossip.csv
```
Start the app:

```bash
ruby app.rb
```
Follow the on-screen instructions.

## 📝 Code Overview

Create a gossip
The user enters an author and content.

The controller creates a Gossip instance and calls save.

Display all gossips
Reads every line of the CSV file and displays them with indexes.

Delete a gossip
Loads all gossips, removes one by index, and rewrites the file.

## ✔️ Requirements
```
Ruby 3.x

Bundler

Gems:

csv

pry (optional, for debugging)
```
### 🎯 Goal of the Exercise
This project helps you understand:

How to structure a small Ruby program using MVC

How controllers, views, and models interact

How to work with CSV files

How to maintain clean and modular code

### 📖 Notes

This is a learning exercise inspired by The Hacking Project’s Ruby curriculum.