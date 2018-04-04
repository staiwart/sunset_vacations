# README

Not much done yet. The application will be using API/data from 'openweathermap.org' and a restCountry ruby-gem to provide a service of the best trips with the most amount of sun.
Graphing Top 10s, comparing cities by weather, displaying a 'trip package' with day-by-day weather reports are all features in the making.

## Running the Application:

To run the application, clone the repository and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database and run the rake tasks:

```
$ rails db:migrate
$ <insert rake tasks>
```

Last but not least, run the tests to verify everything is working properly:

```
$ rails test
```

If all the tests pass, the application is ready to be run:

```
$ rails server
```

You can also find the app deployed on Heroku at:  http://examplelink.heroku-app.com

