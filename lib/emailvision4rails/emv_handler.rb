require 'action_view/template'

module Emailvision4rails
	module EmvHandler
		def self.erb_handler
			@@erb_handler ||= ActionView::Template.registered_template_handler(:erb)
		end

		def self.call(template)
      p template
      p '*'*100
      compiled_source = erb_handler.call(template)
      p compiled_source
      p '*'*100
      p eval(compiled_source)
      p '*'*100
      p "Roadie::Inliner.new(Roadie::AssetPipelineProvider.new, [], begin;#{eval(compiled_source)};end, {}, nil).execute"
      p '*'*100
      if template.formats.include?(:html)
        "Roadie::Inliner.new(Roadie::AssetPipelineProvider.new, [], begin;#{eval(compiled_source)};end, {}, nil).execute"
			else
				compiled_source
			end
		end
	end
end