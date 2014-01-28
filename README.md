Studmuffin
==========

Getting Started
---------------

### Install PostgresSQL
Please make sure your apt-get sources are updated (apt-get update).

``` sh
$ sudo apt-get install postgresql
```

In order for the pq gem (the name of the gem for postgres is shortened to "pq") to work, the following needs to be installed as well.

``` sh
$ sudo apt-get install libpq-dev
```

### Install the required gems:

``` sh
$ bundle install
```

### Running tests:

```sh
$ bundle exec rake
```
