# README

<p>This is a basic Ruby on Rails app with Ruby version 3.2.0. This README.md file provides instructions on how to set up and run the app.</p>
This app was deployed to FLY.io link to app is

[Here](https://cars-management.fly.dev/)

## Requirements

Make sure you have the following installed on your system:

* Ruby version 3.2.0
* Ruby on Rails version 7.0.4.2
* Bundler version 2.4.5
* PostgreSQL version 15

## Installation

1. Clone the repository:

```angular2html
git clone https://github.com/TapTapStitch/cars_management_rails.git
```

2. Install dependencies using Bundler:

```angular2html
cd cars_management_rails
bundle install
```

3. Create the database:

```angular2html
rails db:create
```

4. Run database migrations:

```angular2html
rails db:migrate
```

5. (Optional) Run seed data to create some sample data:

```angular2html
rails db:seed
```

## Usage

To start the app, run the following command:

```angular2html
rails server
```

Once the server is running, open your web browser and go to http://localhost:3000 to access the app.

## Testing

To run the test suite, use the following command:

```angular2html
bundle exec rspec
```
