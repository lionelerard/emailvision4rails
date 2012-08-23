require 'test_helper'

class CampaignTest < ActiveSupport::TestCase
  test "validations" do
  	campaign = Emailvision4rails::Campaign.new
    assert(!campaign.valid?, 'Campaign should NOT be valid')

    campaign = Emailvision4rails::Campaign.new(
	    :name => 'Campaign',
			:mailinglist_id => 123,
			:message_id => 123,
			:send_date => Time.now
    )
    should_be_true = (!campaign.valid? and campaign.errors.has_key?(:send_date))
    assert(should_be_true, 'Campaign should NOT be valid because send_date should be in the future (+5min)')

    campaign = Emailvision4rails::Campaign.new(
      :name => 'Campaign',
      :mailinglist_id => 'invalid',
      :message_id => 'invalid',
      :send_date => Time.now
    )
    should_be_true = (!campaign.valid? and campaign.errors.has_key?(:mailinglist_id) and campaign.errors.has_key?(:message_id))
    assert(should_be_true, 'Campaign should NOT be valid because mailinglist_id and message_id should be numbers')    

    campaign = Emailvision4rails::Campaign.new(
	    :name => 'Campaign',
			:mailinglist_id => 123,
			:message_id => 123,
			:send_date => Time.now+1.day
    )
    assert(campaign.valid?, 'Campaign should be valid')
  end
end