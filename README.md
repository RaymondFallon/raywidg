# RayWidg

This rails app is designed to let a user place an order of Widgets, then receive a confirmation email with a link to their order details. 

## Installing

Ensure that you are using an up-to-date version of Ruby. (I am using Ruby 2.4.2p198)

Unzip file or clone Github repo 

cd to the raywidg directory

Install bundler with:
```
    $ sudo gem install bundler
```
Some dependencies may need to installed outside of the bundler chain:
```
    $ sudo apt-get install build-essential patch ruby-dev zlib1g-dev liblzma-dev
    $ sudo apt-get install libsqlite3-dev
```
Use bundle to install all the other dependencies:
```
    $ bundle install
```
Install NodeJS
```
    $ sudo apt-get install nodejs
```
Activate server in development mode with:
```
    $ rails server
```
Then navigate your broswer to localhost:3000 to use the app

## Testing

To run the test suite:
```
    $ rails test
```

## Use as Admin

To make changes to the orders, admin access is required:

```
username: 'admin'
password: 'uncrackable'
```

Login is required to change tracking details or to delete an order.


