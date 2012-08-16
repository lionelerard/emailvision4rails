require 'test_helper'

class ComplianceTest < ActiveSupport::TestCase
	include ActiveModel::Lint::Tests

	def setup
		@model = Emailvision::Base.new
	end
end