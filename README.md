# Ghettoblaster

Ghettoblaster is your personal email announcement list. Write your emails in Markdown, preview
them with Mailcatcher, and obtain new email submissions from an innocuous looking front page. It
is in use to manage The Wonder Bars/Wax Poetic's email lists as well as
various other lists for small parties.

## Setup

Clone the git repo

    $ git clone git://github.com/tubbo/ghettoblaster.git

Install the gems

    $ cd ghettoblaster && bundle install

Set up the database

    $ rake db

And run the server

    $ rails server puma

## Development

Make sure you do your work in a branch, then submit a Github Pull
Request so we can review your work. If it's acceptable, we'll merge it
in!

Please make sure to include both unit and integration/feature tests for
your code, if possible.
