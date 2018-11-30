# Kompismatchning

Kompismatchning is a tool that helps organizations, cities and municipalities pair immigrants and refugees with people from the local community. It is currently being used by [IM](https://www.manniskohjalp.se) to run the Duo Stockholm program. It is free to use for anyone who wants to set up a similar program.

A demo is available at https://kompismatchning.herokuapp.com/admin. Login with `admin@example.com` and `password`.

## Requirements

Kompismatchning is built with Ruby on Rails and requires a server running Ruby and an SQL database such as Postgres. An e-mail service such as [SendGrid](https://www.sendgrid.com) is required to send e-mails. We recommend installing and running the application on the [Heroku](https://www.heroku.com) platform.

## Running the application locally

First, make sure you have Ruby, Bundler and Postgres installed. Next, clone the project and run the setup script:

```sh
$ bin/setup
```

This will create the database and start the application.

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

Heroku Scheduler needs to be configured to run some tasks at regular intervals. Open the dashboard:

```sh
$ heroku addons:open scheduler
```

Configure the scheduler to run `rails matches:mails` daily at the time you want match participants to receive their follow up and conclusion mails. Also configure it to run `rails matches:destroy_concluded` daily to destroy matches (and people) at a configurable time after conclusion.

### Configure SendGrid

In order to send mails from the system, a mail service such as SendGrid is needed. If you wish to use a different service, install the appropriate addon and reconfigure the mail settings in `config/production.rb`.

If using SendGrid, please note that you might need to change and confirm your e-mail address through their dashboard. Open it using:

```sh
$ heroku addons:open sendgrid
```

## Configure the application

The application can be configured by modifying the `config/application.rb` file. The following configuration options are available:

```ruby
# The time after which to send a follow up email to match participants.
config.follow_up_matches_after = 1.month

# The time after which to automatically conclude matches.
config.conclude_matches_after = 6.months

# The time after which to automatically destroy concluded matches and people.
config.destroy_matches_and_people_after = 2.months
```
