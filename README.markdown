Emailvision ruby on rails library
=================================

Emailvision4rails is a library used to manage messages and campaigns or more simply newsletters from your rails application.

/!\ Not released yet /!\

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

Generator
---------

Emailvision4rails is bundled with a newsletter generator.

```shell
$ rails generate newsletter standard daily weekly
	create  app/newsletters/standard_newsletter.rb
	create  app/views/standard_newsletter/daily.html.emv
	create  app/views/standard_newsletter/daily.text.emv
	create  app/views/standard_newsletter/weekly.html.emv
	create  app/views/standard_newsletter/weekly.text.emv
```

Models
------

Models are ActiveModel compliant

**Campaign**

Attributes

*   **name**
*   **mailinglist_id**
*   **message_id**
*   **send_date**
*   description
*   emaildedupflg 
*   format 
*   delivery_speed 
*   notification
*   post_click_tracking
*   strategy
*   target
*   url_end_campaign
*   url_host
*   analytics

*Bold attributes must be present*

Example

```ruby
campaign = Emailvision4rails::Campaign.new(
	:name => 'Campaign',
	:mailinglist_id => 123,
	:message_id => 123,
	:send_date => Time.now+30.minutes
)

if campaign.create
	# Campaign created
else
	campaign.errors
end
```

**Message**

Attributes

*   **name**
*   **subject**
*   **from**
*   **from_email**
*   **body**
*   **reply_to**
*   **reply_to_email**
*   id
*   create_date
*   to 
*   description
*   encoding
*   hotmail_unsub_url
*   type
*   hotmail_unsub_flg
*   is_bounceback

*Bold attributes must be present*

```ruby
message = Emailvision4rails::Message.new(
	message_content,
	:name => 'My message',
	:subject => 'Hello',
	:from => 'Bastien Gysler', 
	:from_email => 'basgys@gmail.com',
	:reply_to => 'Bastien Gysler',
	:reply_to_email => 'basgys@gmail.com'
)

if message.create
	# Message created
else
	message.errors
end
```

Newsletter (Controller)
-----------------------

Newsletters work like mailers. These are stored in the *newsletters* directory (/app/newsletters)

**Example**

```shell
$ rails generate newsletter standard
```

```ruby
class StandardNewsletter < Emailvision4rails::AbstractNewsletter

	def daily_fr(params = {})
		newsletter(
			:message => default_message_params,
			:campaign => default_campaign_params.merge(:send_date => Time.now+1.day, :mailinglist_id => 123)
		)
	end

	private

	def default_message_params
		{
			:name => 'My message',
			:subject => 'Hello',
			:from => 'Bastien Gysler', 
			:from_email => 'basgys@gmail.com',
			:body => my_body,
			:reply_to => 'Bastien Gysler',
			:reply_to_email => 'basgys@gmail.com'
		}
	end

	def default_campaign_params
		{
			:name => 'Campaign campaign'
		}
	end

end
```

```ruby
StandardNewsletter.daily_fr.publish
```

Views
-----

Views are stored in app/views and are suffixed by _newsletter.

Two formats are available which are html and text and both must be present. Otherwise and ActionView::MissingTemplate error will be raised.

Template engine that should be used is emv, but others work too.

EMV template engine
-------------------

EMV is an engine built on top of ERB, but it also adds CSS inlining for HTML files.

It means you can create your views just like others and EMV will do the dirty work to be "email ready".

Author
------

Bastien Gysler :: [bastiengysler.com](http://www.bastiengysler.com/) :: @basgys