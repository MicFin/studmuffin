Studmuffin
==========

Getting Started
---------------

### Setup RVM

Install via the instructions on the [RVM Install Page][] to install. On Linux, do
not use the version provided via apt-get.

Install and configure your default ruby. As of this writing we are using
MRI 2.0.0-p247.

[RVM Install Page]: http://rvm.io/rvm/install

### Install PhantomJS

[PhantomJS][] is a headless webkit implementation used for running integration
tests that require javascript.

On **OS X**, install with [Homebrew][]

``` sh
$ brew install phantomjs
```

On **Linux**, install via prebuilt binary provided on the [PhantomJS Downloads][]
page. As of this writing we are using version 1.9.2, but please check to see
if there is an updated binary available.

``` sh
cd /usr/local/share
sudo wget https://phantomjs.googlecode.com/files/phantomjs-1.9.2-linux-x86_64.tar.bz2
sudo tar xjf phantomjs-1.9.2-linux-x86_64.tar.bz2
cd /usr/local/share && sudo ln -s /usr/local/share/phantomjs-1.9.2-linux-x86_64/bin/phantomjs
cd /usr/local/bin && sudo ln -s /usr/local/share/phantomjs-1.9.2-linux-x86_64/bin/phantomjs
cd /usr/bin && sudo ln -s /usr/local/share/phantomjs-1.9.2-linux-x86_64/bin/phantomjs
```

[PhantomJS]: http://phantomjs.org/
[Homebrew]: http://brew.sh/
[PhantomJS Downloads]: http://phantomjs.org/download.html

### Install PostgresSQL
Make sure your apt-get sources are updated

``` sh
sudo apt-get update
```

Install postgres

``` sh
$ brew install postgresql           # Mac
$ sudo apt-get install postgresql   # Linux
```

In order for the pq gem (the name of the gem for postgres is shortened to "pq") to work, the following needs to be installed as well.

``` sh
$ sudo apt-get install libpq-dev
```

Create a postgres user

Create the default db user named "pguser", authenticated via the password pgpass (which you will be prompted for two times via the command below):
``` sh
# on debian derivatives, including Ubuntu
$ sudo su postgres -c 'createuser -P -d pguser'

# on OS X
$ createuser -P -d pguser
```

### Install the required gems:

``` sh
$ bundle install
```

### Prepare your databases

``` sh
$ rake db:create
$ rake db:migrate
$ rake db:test:prepare
$ rake db:seed
```

### Setup your Environment

You will need to create a `.env` file in the root of the project to define
some configuration and security settings. An example env file has been
provided in the root of this project as `env.example`. Copy this file to
`.env` and fill in the values as needed.

If you run the app via `foreman start`, the environment variables in the
`.env` file will be exported automatically. If you run outside of foreman,
you can use the following to populate the env vars:

``` sh
export `cat .env`
```

### Running the development server

``` sh
$ foreman start
```

### Running tests:

```sh
$ bundle exec rake
```
