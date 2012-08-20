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
	:name => 'My message',
	:subject => 'Hello',
	:from => 'Bastien Gysler', 
	:from_email => 'basgys@gmail.com',
	:body => my_body,
	:reply_to => 'Bastien Gysler',
	:reply_to_email => 'basgys@gmail.com'
)

if message.create
	# Message created
else
	message.errors
end
```

Controller (Newsletter)
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

Author
------

Bastien Gysler :: [bastiengysler.com](http://www.bastiengysler.com/) :: @basgys