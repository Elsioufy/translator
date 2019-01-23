## PhraseApp

This is a mini app called mini phraseapp at which it can manage and translate articles.

## This project is using the following configuration:

* Ruby version: 2.4.1

* Rails version: 5.2.2

* Postgres database


## Services that is used:

* Rails admin to manage the system

* Amazon Translate

* Redis for caching


## The steps to use phraseapp:

* clone project

* Make sure versions of ruby and rails are correct

* Make sure postgres is installed and running

* Run: `bundle install`

* Make sure to copy `config/database.local.yml.sample` content to `config/database.local.yml` new file and have the correct configuration (Do not make any changes to the yml sample).

* The same applies to aws, make sure to copy `config/aws.yml.sample` content to `config/aws.yml` and have the right configuation including the access and the secret key (Do not make any changes to the yml sample)

* `rails db:create` and `rails db:migrate`

* run redis (Make sure you have the correct configuration setup in your config environment file) (Defaults to localhost)

* Cached is being used in development (Make sure to change it to `config.action_controller.perform_caching = false` in `config/development.rb` in case you want to disable it)

* You are good to go to run the server

## Views

We have two views, one for the admin and one for the user/customer.


The admin goes to `/admin` and the admin has the authority to manage articles (No authentication required)

Users/Customers can go to home page to view the articles.

The Admin can manage articles, initating a new article or updating it in english, it automatically gets translated in German and saves it in the database.

The updated translation can be seen either in admin or home page after changing the language.

## Testing

We use rspec, our main spec tests are found under: `spec/`, to run existing tests type: `rspec`

## Deployment

For deploying on heroku:

* Make sure `config/aws.yml` is present with the right configuration before proceeding.
