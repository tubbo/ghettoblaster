# Ghettoblaster

Ghettoblaster is your personal email announcement list. Write your emails
and preview them on-the-fly, then deliver them to your entire list with
one click. You can obtain new email submissions from our
innocuous-looking front page.

## In The Wild

It's in use to manage the mailing list for Wonder Bars/Wax Poetic/Wyld
Lyfe events as well as by other event promoters in Philadelphia...

## Setup

Clone the git repo:

```bash
$ git clone git://github.com/tubbo/ghettoblaster.git
```

Install dependencies:

```bash
$ cd ghettoblaster
$ brew install phantomjs # or use your own package manager
$ bundle install
```

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
