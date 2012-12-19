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

Here's how to deploy on Heroku. It works.

Create the app and push the code up

  $ heroku create my-ghettoblaster
  $ git push heroku master

Set up the database

  $ heroku run rake db:migrate

Now, you can browse to <http://my-ghettoblaster.herokuapp.com/admin> and log in with
username **admin@example.com** and password **password**. You should probably change this.

Edit the settings in the "Settings" tab, the `flyer_url` is the image shown on the front page,
while the `party_name` is the title used practically everywhere else. If you have a Facebook event,
plug it in the `facebook_event` setting, or else you can make this a link to tickets or anything
else.

## Work In Progress

Note that this is a WIP and isn't fully developed.

## Roadmap

- Add other copy text options to the front page.
- Create "Blasts", which are messages to be sent out to the entire list of Subscribers when
  saved.
- Compose Blasts in Markdown. Convert Markdown to HTML before sending out.
- Use Mailcatcher in development when writing emails.
