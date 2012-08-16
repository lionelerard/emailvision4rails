require 'test_helper'

class NavigationTest < ActiveSupport::IntegrationCase
  test "truth" do
    assert_kind_of Dummy::Application, Rails.application
  end

  test '.emv template handler' do
  	visit '/home/index'
  	expected = 'Newsletter <b>template handler</b>'
  	assert_match expected, page.body
  end
end
