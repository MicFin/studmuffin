Studmuffin
==========

Getting Started
---------------

### Setup RVM

Install via the instructions on the [RVM Homepage][] to install. On Linux, do
not use the version provided via apt-get.

Install and configure your default ruby. As of this writing we are using
MRI 2.0.0-p247.

[RVM Homepage]: http://rvm.io/

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

***A note for debian derivatives***

If `apt-cache show phantomjs` shows a version >= 1.9.0, you can install
directly from the vendor provided repositories via `sudo apt-get install phantomjs`.
debian testing (currently jessie), for example, has a recent enough phantomjs.


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
$ sudo apt-get install postgresql
```

In order for the pq gem (the name of the gem for postgres is shortened to "pq") to work, the following needs to be installed as well.

``` sh
$ sudo apt-get install libpq-dev
```
Prepare your databases

``` sh
$ rake db:create
$ rake db:migrate
$ rake db:test:prepare
```

### Install the required gems:

``` sh
$ bundle install
```

### Running the development server

``` sh
$ rails s
```

### Running tests:

```sh
$ bundle exec rake
```
