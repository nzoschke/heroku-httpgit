# heroku-httpgit

Set the remote on app creation to an HTTP remote, instead of an SSH remote.

## Warning

The HTTP remote is very much a work in progress. It's location and functionality
will change.

## Installation

    $ heroku plugins:install https://github.com/nzoschke/heroku-httpgit.git

## Usage
    $ heroku create -s cedar 
    Creating stark-sunrise-7399... done, stack is cedar
    http://stark-sunrise-7399.herokuapp.com/ | git@heroku.com:stark-sunrise-7399.git
    Git remote heroku added
    
    $ git remote -v
    heroku  http://code-production.herokuapp.com/stark-sunrise-7399.git (fetch)
    heroku  http://code-production.herokuapp.com/stark-sunrise-7399.git (push)

    $ git push heroku master
    Counting objects: 1919, done.
    Delta compression using up to 4 threads.
    Compressing objects: 100% (665/665), done.
    Writing objects: 100% (1919/1919), 25.37 MiB | 1.54 MiB/s, done.
    Total 1919 (delta 1160), reused 1919 (delta 1160)
    remote: 
    remote: -----> Heroku receiving push
    ...
