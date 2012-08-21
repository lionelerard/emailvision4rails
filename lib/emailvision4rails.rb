require 'rails'

require 'active_model/conversion'
require 'active_model/attribute_methods'
require 'active_model/validations'
require 'active_model/callbacks'

require 'abstract_controller/rendering'
require 'action_mailer/collector'

require 'action_view'

require 'premailer'

require 'emailvision'

module Emailvision4rails
	# Base
	autoload :EmvHandler, 'emailvision4rails/emv_handler'
	autoload :Collector, 'emailvision4rails/collector'
	autoload :Newsletter, 'emailvision4rails/newsletter'
	autoload :Configuration, 'emailvision4rails/configuration'

	# Models
	autoload :Base, 'emailvision4rails/models/base'
	autoload :Message, 'emailvision4rails/models/message'
	autoload :Campaign, 'emailvision4rails/models/campaign'

	# Newsletters (Controller)
	autoload :AbstractNewsletter, 'emailvision4rails/newsletters/abstract_newsletter'

	ActionView::Template.register_template_handler :emv, EmvHandler	

	require 'emailvision4rails/railtie'
end