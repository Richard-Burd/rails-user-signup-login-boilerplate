
# Rails User Signup / Login Boilerplate App

## Overview
This program is a simple Rails app that authenticates existing users, allows new users to sign up, and allows users to sign up or login (as current users) using GitHub OmniAuth...AKA GitHub OAuth.

## About This Program
<p>The code implemented in this space is based on the Flatiron School's Online Web App Development Program as of November 26th, 2019. &nbspThere are two code-along videos used as references; the <a href='https://www.youtube.com/watch?v=gB7lYvfL4J4'>Authentication in Rails Video</a> and the <a href='https://www.youtube.com/watch?v=UAvuo-EbTFY'>Implementing OmniAuth Video</a>.  &nbspIf you are a student in the Flatiron School's online web app development program, you can use this workspace as a reference when working on the Rails portfolio project.  &nbspYou can also clone a copy and use it as a start-point for the rails project.</p> <p>The basic idea here is to get the user login & signup interfaces working properly before building an app that users will actually use. &nbspThis can prevent headaches down the line if implemented correctly.</p>

## Install instructions
Clone this repo into your IDE and run `$ bundle install`.  After that, run `$ rails s` to run your server...copy & paste the domain into a web browser URL and go from there.

### Project File Structure
```
├── .gitignore
├── Gemfile
├── Gemfile.lock
├── README.md
├── app
│   ├── assets
│   │   ├── stylesheets
│   │   │   └── homeapp.scss
│   ├── controllers
│   │   ├── admin_controller.rb
│   │   ├── application_controller.rb
│   │   ├── sessions_controller.rb
│   │   ├── site_controller.rb
│   │   └── users_controller.rb
│   ├── models
│   │   ├── application_record.rb
│   │   └── user.rb
│   └── views
│       ├── layouts
│       │   ├── application.html.erb
│       │   └── app_layout.html.erb
│       ├── sessions
│       │   └── new.html.erb
│       ├── site
│       │   ├── homeapp.html.erb
│       │   └── index.html.erb
│       ├── users
│       │   └── new.html.erb
└── db
    ├── migrate
    │   ├── 20191103143512_create_users.rb
    │   └── 20191105213844_add_password_digest_to_users.rb
    ├── schema.rb
    └── seeds.rb
```
