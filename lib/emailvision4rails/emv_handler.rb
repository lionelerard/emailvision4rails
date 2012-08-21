module Emailvision4rails
	module EmvHandler
		def self.erb_handler
			@@erb_handler ||= ActionView::Template.registered_template_handler(:erb)
		end

		def self.call(template)
			compiled_source = erb_handler.call(template)
			if template.formats.include?(:html)
				options = {
					:warn_level => Premailer::Warnings::SAFE,
					:with_html_string => true
				}
				"Premailer.new((begin;#{compiled_source};end), #{options}).to_inline_css"				
			else
				compiled_source
			end
		end
	end
end