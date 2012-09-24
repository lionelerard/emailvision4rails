module Emailvision4rails
	class RenderedViews

		attr_accessor :parts

		def initialize(parts = {})
			@parts = parts
		end

		def content
			parts.map do |format, content|
				"[EMV #{format.upcase}PART]\n#{content}"
			end.join("\n")
		end

		def to_html
			parts[:html]
		end

		def to_text
			parts[:text]
		end		

		def to_s
			content
		end

	end
end