class Emailvision::BaseController < AbstractController::Base
	include AbstractController::Rendering

	def initialize
		lookup_context.formats = [:html, :text] # Restrict rendering formats to html and text
	end

	def publish			
		puts "action : #{action_name}"
		puts "context : #{lookup_context.inspect}"
	end

	def collect_responses
		collector = ActionMailer::Collector.new(lookup_context) { render(action_name) }
	end
end