require 'test_helper'

class ComplianceTest < ActiveSupport::TestCase
	include ActiveModel::Lint::Tests

	def setup
		@model = Emailvision4rails::Base.new
	end
end