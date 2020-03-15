# Mini Pokemon CLI Application

## Demo

![DemoGif](https://github.com/rclarkem/Mini-Pokemon-Game/blob/master/mod1.gif)

## Technologies

- Ruby
- Sqlite3
- ActiveRecord
- Launchy gem

## Project Description

### Overview:

A mini pokemon CLI app where the user can create a simple profile where they start off by choosing their starter pokemon. The user can:

- Decide to catch more pokemon by entering the 'safari zone'
- Release pokemon they have
- Edit their pokemon's nicknames
- View all of their currently held pokemon

- There is also a **Pokedex feature** that allows the users to type in a pokemon and it will launch the web browser and open [bulbapedia.bulbagarden.net](https://bulbapedia.bulbagarden.net/) (the wikipedia for the pokemon universe) for that particular pokemon.

#### Challenges:

Build a **Command Line CRUD App** that uses a database to persist information. The goal of which is to demonstrate all of the skills that you've learned in module one:

- Ruby
- Object Orientation
- Relationships (via ActiveRecord)
- Problem Solving (via creating a Command Line Interface (CLI))

#### Requirements:

Your **minimum requirements** for this project are to build a Command Line App that:

1. Contains at least three models with corresponding tables, including a join table.
2. Accesses a Sqlite3 database using ActiveRecord.
3. Has a CLI that allows users to interact with your database as defined by your _user stories_ (minimum of four; one for each CRUD action).
4. Uses good OO design patterns. You should have separate models for your runner and CLI interface.

## Instructions for Cloning Repo

### Prerequisites

Mini Pokemon CLI is built on Ruby & SQLite. Make sure you have the latest versions of all components installed before cloning this repo. You can find their official installation guides below:

- [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
- [SQLite](https://www.sqlite.org/download.html)

### Instructions

- Clone the most recent branch in this repository
  > Make sure you are in the project path before running the commands
- Run `bundle install` in your bash-enabled terminal to make sure all dependancies are installed
- Run `rake db:create` to create a local PostgreSQL database
- Run `rake db:migrate` to create the schema for said database
- Run `rake db:seed` to seed the database
- Run `ruby bin/run.rb` to start up program
  > Adjust the terminal screen size to have the best experience

## Collaborators

| Name           | Github Profile                               |
| -------------- | -------------------------------------------- |
| Stephen Rivera | [strivera94 ](https://github.com/strivera94) |
