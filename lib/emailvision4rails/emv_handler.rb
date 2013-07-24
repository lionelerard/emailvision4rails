require 'action_view/template'

module Emailvision4rails
	module EmvHandler
		def self.erb_handler
			@@erb_handler ||= ActionView::Template.registered_template_handler(:erb)
		end

		def self.call(template)
      compiled_source = erb_handler.call(template)
      if false and template.formats.include?(:html)
        puts template
        puts '*'*100
        puts compiled_source
        puts '*'*100
        output_buffer = nil
        #puts eval(compiled_source)
        puts '*'*100
        #puts "Roadie::Inliner.new(Roadie::AssetPipelineProvider.new, [], begin;\"#{compiled_source}\";end, {}, nil).execute"
        puts '*'*100

        "Roadie::Inliner.new(Roadie::AssetPipelineProvider.new, [], (begin;#{compiled_source};end), {}, nil).execute" unless compiled_source.blank?
			else
				compiled_source
			end
		end
	end
end