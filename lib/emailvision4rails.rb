require 'rails'
require 'action_view'
require 'emailvision'

module Emailvision4rails
	# Base
	autoload :EmvHandler, 'emailvision4rails/emv_handler'
	autoload :Collector, 'emailvision4rails/collector'
	autoload :Newsletter, 'emailvision4rails/newsletter'
	autoload :Configuration, 'emailvision4rails/configuration'
	autoload :Version, 'emailvision4rails/version'	

	# Models
	autoload :Base, 'emailvision4rails/models/base'
	autoload :Message, 'emailvision4rails/models/message'
	autoload :Campaign, 'emailvision4rails/models/campaign'

	# Newsletters (Controller)
	autoload :AbstractNewsletter, 'emailvision4rails/newsletters/abstract_newsletter'

	ActionView::Template.register_template_handler :emv, EmvHandler	

	if defined?(Rails)
		require 'emailvision4rails/railtie'
	end
end