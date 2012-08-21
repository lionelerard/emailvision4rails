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
    assert(!campaign.valid?, 'Campaign should NOT be valid because send_date should be in the future (+5min)')

    campaign = Emailvision4rails::Campaign.new(
	    :name => 'Campaign',
			:mailinglist_id => 123,
			:message_id => 123,
			:send_date => Time.now+1.day
    )
    assert(campaign.valid?, 'Campaign should be valid')
  end
end