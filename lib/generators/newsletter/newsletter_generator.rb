class NewsletterGenerator < Rails::Generators::NamedBase
	argument :actions, :type => :array, :default => [], :banner => "action action"
	check_class_collision :suffix => "Newsletter"
	source_root File.expand_path("../templates", __FILE__)

	def create_controller_files
		template 'newsletter.rb', File.join('app/newsletters', class_path, "#{file_name}_newsletter.rb")
	end
end