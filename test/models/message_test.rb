require 'test_helper'

class MessageTest < ActiveSupport::TestCase
	test "validations" do
  	message = Emailvision4rails::Message.new
    assert(!message.valid?, 'Message should NOT be valid')

    message = Emailvision4rails::Message.new(
    	'Content',
			:name => 'Message',
			:subject => 'Subject',
			:from => 'our@mail.com',
			:from_email => 'Our Company',
			:reply_to => 'our@mail.com', 
			:reply_to_email => 'Our Company'
    )    
    assert(message.valid?, 'Message should be valid')
  end
end