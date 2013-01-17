# Ghettoblaster

Ghettoblaster is your personal email announcement list. Write your emails in Markdown, preview
them with Mailcatcher, and obtain new email submissions from an innocuous looking front page. It
is in use to manage the Wonder Bars' email list.

## Installation

Clone the git repo

    $ git clone git://github.com/tubbo/ghettoblaster.git

Install the gems

    $ cd ghettoblaster && bundle install

Then, deploy it just like any other Rails app. Uses Postgres by default.

## Deploying on Heroku

Here's how to deploy on Heroku. It works. If you wish, you can fork the project and change the
`.travis.yml` file to use your own Heroku API key, and deploy to Heroku simply by virtue of
a passing test suite. We currently use Travis-CI to manage our continuous deployment on
vip.thewonderbars.com.

Create the app and push the code up

    $ heroku create my-ghettoblaster
    $ git push heroku master

Set up the database and load starter data

    $ heroku run rake db:migrate db:seed

Now, you can browse to <http://my-ghettoblaster.herokuapp.com/admin> and log in with
username **admin@example.com** and password **password**. You should probably change this.

Edit the settings in the "Settings" tab, the `flyer_url` is the image shown on the front page,
while the `party_name` is the title used practically everywhere else. If you have a Facebook event,
plug it in the `facebook_event` setting, or else you can make this a link to tickets or anything
else.

## Work In Progress

Note that this is a WIP and isn't fully developed. Below are the tasks we have not completed yet.

### Roadmap

- Add other copy text options to the front page.
- Create "Blasts", which are messages to be sent out to the entire list of Subscribers when
  saved.
- Compose Blasts in Markdown. Convert Markdown to HTML before sending out.
- Use Mailcatcher in development when writing emails.
