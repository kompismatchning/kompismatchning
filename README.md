# Blending

Blending is a tool that helps organizations, cities and municipalities with pairing immigrants and refugees with people from the local community. It is currently being used by [IM](https://www.manniskohjalp.se) to run the Duo Stockholm program. It is free to use for anyone who wants to set up a similar program.

## Requirements

Blending is built with Ruby on Rails and requires a server running Ruby and an SQL database such as Postgres. An e-mail service such as [SendGrid](https://www.sendgrid.com) is required to send e-mails. We recommend installing and running the application on the [Heroku](https://www.heroku.com) platform.

## Running the application locally

First, make sure you have Ruby, Bundler and Postgres installed. Next, clone the project and install its dependencies:

```sh
$ bundle install
```

Create the database and run pending migrations:

```sh
$ rails db:create
$ rails db:migrate
```

Finally, to start the application:

```sh
$ rails server
```

Navigate to http://localhost:3000

## Deploying the application to Heroku

Register an account at [Heroku](https://www.heroku.com) and follow the instructions. Make sure to install the toolbelt as well.

While in the project directory, create a new application:

```sh
$ heroku create
```

The application will be created and given a name and a URL. You can change these later using the Heroku Dashboard.

You need to install the following Heroku addons:

```sh
$ heroku addons:create heroku-redis:hobby-dev
$ heroku addons:create scheduler:standard
$ heroku addons:create sendgrid:starter
```

Deploy the application and run migrations:

```sh
$ git push heroku master
$ heroku run rails db:migrate
```

### Configure Scheduler

### Configure SendGrid

## Configure the application

The application can be configured by modifying the `config/application.rb` file. The following configuration options are available:

```ruby
# The time after which to send a follow up email to match participants.
config.follow_up_matches_after = 1.month

# The time after which to automatically conclude matches.
config.conclude_matches_after = 6.months
```
