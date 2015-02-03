# Tamagotchi
This is an app that allows the user to create tamagotchis and care for them.  There is also the advanced option of caring for two tamagotchis at the same time.
## Setup Instructions:
### Gems Used:
```
sinatra
sinatra-contrib
sinatra-activerecord
rake
pg
pry
rspec
shoulda-matchers
```
### Install Bundler:
```
$ gem install bundler
```
### Run Bundler:
```
$ bundle
```
### Start the database:
```
$ postgres
```
### Create databases:
```
$ rake db:create
$ rake db:migrate
$ rake db:test:prepare
```
### Bug Reports
The user must select one or two tamagotchis to play.
### Author
Alex Kaufman & Gabe Finch
#### MIT License
