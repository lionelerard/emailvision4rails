Emailvision ruby on rails library
=================================

Emailvision4rails is a library used to manage messages and campaigns or more simply newsletters from your rails application.

[![Build Status](https://secure.travis-ci.org/basgys/emailvision4rails.png)](http://travis-ci.org/basgys/emailvision4rails)

Install
-------

### Without bundler

```shell
$ gem install emailvision4rails
```

### With bundler

Past this line to your Gemfile

```ruby
gem 'emailvision4rails'
```

Setup
-----

```shell
$ rails generate emailvision4rails:setup
```

This will create the following config file : **config/emailvision.yml**

Generator
---------

```shell
$ rails generate newsletter standard daily weekly
	create  app/newsletters/standard_newsletter.rb
	create  app/views/standard_newsletter/daily.html.emv
	create  app/views/standard_newsletter/daily.text.emv
	create  app/views/standard_newsletter/weekly.html.emv
	create  app/views/standard_newsletter/weekly.text.emv
```

Publication

```ruby
StandardNewsletter.daily.publish
```

Preview

```ruby
StandardNewsletter.daily.to_html # or to_text
```

More infos
----------

If you want to dig deeper, Go see our wiki pages.

Meta
----

This project uses [Semantic Versioning](http://semver.org/).

Author
------

Bastien Gysler :: [bastiengysler.com](http://www.bastiengysler.com/) :: @basgys

[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/29de0b7cb36b0eb1bdd31740b3056f71 "githalytics.com")](http://githalytics.com/basgys/emailvision4rails)