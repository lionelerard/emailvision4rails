require 'action_view/template'

module Emailvision4rails
	module EmvHandler
		def self.erb_handler
			@@erb_handler ||= ActionView::Template.registered_template_handler(:erb)
		end

		def self.call(template)
      erb_handler.call(template)
		end
	end
end