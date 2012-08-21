class NewsletterGenerator < Rails::Generators::NamedBase
	argument :actions, :type => :array, :default => [], :banner => "action action"
	check_class_collision :suffix => "Newsletter"
	source_root File.expand_path("../templates", __FILE__)

	def create_newsletter_file
		template 'newsletter.rb', File.join('app/newsletters', class_path, "#{file_name}_newsletter.rb")
	end

	def create_view_files
		actions.each do |action|
			available_formats.each do |format|
				template "action.#{format}.emv", File.join('app/views', class_path, "#{file_name}_newsletter", "#{action}.#{format}.emv")
			end			
		end
	end	

	protected

	def available_formats
		%w(html text)
	end	
end