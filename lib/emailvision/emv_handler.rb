module Emailvision
	module EmvHandler
		def self.erb_handler
			@@erb_handler ||= ActionView::Template.registered_template_handler(:erb)
		end

		def self.call(template)
			compiled_source = erb_handler.call(template)
			# Do something (inline css, ...)
			compiled_source
		end
	end
end