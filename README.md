# README

This a mini app for phraseapp at which it can manage articles.

This project is using the following configuration:

* Ruby version: 2.5.1

* Rails version: 5.2.2

* Postgres database

* Rails admin to manage articles


The steps to use phraseapp:

* clone project

* Make sure ruby and rails versions are correct

* Make sure postgres is installed and running

* bundle install

* Make sure to copy database.local.yml.sample to database.local.yml and make sure you have the right configuration in the new file. (Do not make any changes to the sample yml but to the new file).

* The same applies to aws, make sure to copy aws.yml.sample to aws.yml and to have the right configuation including the access and the secret key (Do not make any changes to the sample yml but to the new file)

* rails db:create and rails db:migrate

* run sidekiq and redis

* You are good to go to run the server


We have now two views, one for the admin and one for the user/customer.


The admin goes to http://localhost:3000/admin and he has the authority to manage everything

Users/Customers can go to http://localhost:3000 to view the articles.

The Admin can manage articles, initating a new article or updating it in english, it automatically gets translated in German and saves in the database (Translation runs in async job using sidekiq in case of heavy traffic).

The updated translation can be seen either in rails admin or in localhost:3000 after changing the language.

Note: English is the default language in this project at which it gets translated to other languages, any other language can not be translated to English.





