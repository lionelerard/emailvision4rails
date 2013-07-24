require 'action_view/template'

module Emailvision4rails
	module EmvHandler
		def self.erb_handler
			@@erb_handler ||= ActionView::Template.registered_template_handler(:erb)
		end

		def self.call(template)
			compiled_source = erb_handler.call(template)
			if template.formats.include?(:html)
        "Roadie::Inliner.new(Roadie::AssetPipelineProvider.new, [], begin;#{compiled_source};end, {}, nil).execute"
			else
				compiled_source
			end
		end
	end
end