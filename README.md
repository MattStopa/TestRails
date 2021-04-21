# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#edit cred in docker 
EDITOR="vi" rails credentials:edit

# Take local DB and upload to Heroku
First dump the file :
pg_dump -Fc --no-acl --no-owner -U postgres railsapp_development > whatevername

Copy file docker to win
docker cp f69c242e5edc:/dump/whatevername ./whatevername

Restore 
 heroku pg:backups:restore "https://nutr222.s3.amazonaws.com/whatevername" postgresql-shaped-12345 --app your-app-name