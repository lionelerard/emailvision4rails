module Emailvision4rails
	class SetupGenerator < Rails::Generators::Base

		source_root File.expand_path('../templates', __FILE__)

		def copy_config_template
			copy_file "emailvision.yml", "config/emailvision.yml"
		end

	end
end