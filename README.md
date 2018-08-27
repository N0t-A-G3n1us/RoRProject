# RoRProject
This is a web application based on Ruby On Rails to connect users and let them chat in order to meet each other in "Groups", set of people that want to play specific games, or in "Teams", set of player ready to challenge other teams.
The app uses Twitch API to show some twitch streams based on user's games.     
Heroku free service is been used to deploy the application. 

The app is accessible at this link: https://playersarena.herokuapp.com/  

Sapienza University of Rome, project made by three students check Contact section for more info.

#Install and start


## Getting started

To get started with the app, clone the repo and go to app's root directory:

```
$ cd arena_app
``` 
(this is the app directory, others are just information ones)

Then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, go ahead to redis installation.

Now you have to install Redis server that handles through websockes the chatrooms' system.

## Install Redis for websocket setup 

Download and install redis software

```
$ wget http://download.redis.io/redis-stable.tar.gz
$ tar xvzf redis-stable.tar.gz
$ cd redis-stable
$ make
```
It is a good idea to copy both the Redis server and the command line interface in proper places, either manually using the following commands:

```
$ sudo cp src/redis-server /usr/local/bin/
$ sudo cp src/redis-cli /usr/local/bin/

```
Or just using 

```

$ sudo make install.

```

In the following documentation we assume that /usr/local/bin is in your PATH environment variable so that you can execute both the binaries without specifying the full path.

Run the redis server on another shell 

```
$ redis-server
```

## Start the app
You are ready to run the app in a local server, run in a shell:

```
$ rails server
```
And run in an other shell:
```
$ redis-server
```

You can access the app at: http://localhost:3000/




Things you may want to cover:

## Ruby version
The app uses Ruby 2.3.0

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...







