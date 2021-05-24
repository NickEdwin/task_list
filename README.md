# Board Packager Challenge - Task List ! 

## Table of Contents

- [Introduction](#introduction)
- [Background Information](#background-information)
- [Running Instructions](#running-instructions)
- [Visual Schema](#visual-schema)
- [Limitations](#limitations)

<!-- Brief Description -->

## Introduction  
Don't be like this guy!  
![Organized?](https://uvmbored.com/wp-content/uploads/2021/03/giphy-1.gif)  
Stay organized with Task List! 

This application allow you to:
- Create Users in your system  
- Create Tasks and assign users to them  
    - Tasks can be sorted by due date, completion status, or due today!  
    - Tasks can have multiple tags assigned to them and you can view all tasks with the same tag.  

Landing Page:  
![Main Page](https://i.imgur.com/6zVQXTU.png)  

## Background Information  
This is application is built with Ruby 2.7.3, Rails 6.1.3.2, and Docker 20.10.6.  
Gems used: 
- Bootstrap - for styling  
- Active Designer - to view database  
- RSpec, Simplecov for testing (Current testing at 100% coverage.)  

## Visual Schema  
Kudos to the ([Active Designer Gem](https://github.com/thomschlereth/active_designer)) for making it easy to visualize your DB!  

![DB](https://i.imgur.com/y26Utfd.png)  
Database Tables:  
- Users  
- Tasks  
- Tags  
- UserTasks - for many-to-many relationship between users and tasks  
- Taggings - for many-to-many relationship between tasks and tags  

## Running Instructions  
To setup locally:
* Clone this repo by running the following commands in your terminal:  
    * `git@github.com:NickEdwin/task_list.git`  
    * `cd task_list`  
    * `bundle install`  
    * `rails db:{create,migrate,seed}`  
    * `bundle exec rspec` to see tests run  
    * `rails s` to fire up local server  
    * Navigate to localhost:3000 in your browser to see app in action! 


## Limitations  
  Maybe there's a bug or two... maybe there isn't!! No no, there definitely is.  
  - First noticeable one is clicking sort with tasks that fit params - app says theres nothing
    - This needs to be fixed in controller
  - Also form drop down isn't allowing option to select multiple people to assign to tasks  
    - I blame bootstrap! 
