require 'rails'
require 'action_view'
require 'premailer'
require 'emailvision'

module Emailvision4rails
	# Base
	autoload :EmvHandler, 'emailvision4rails/emv_handler'
	autoload :Collector, 'emailvision4rails/collector'
	autoload :Newsletter, 'emailvision4rails/newsletter'
	autoload :Configuration, 'emailvision4rails/configuration'
	autoload :Premailer, 'emailvision4rails/premailer'
	autoload :RenderedViews, 'emailvision4rails/rendered_views'
	autoload :Version, 'emailvision4rails/version'	

	# Models
	autoload :Base, 'emailvision4rails/models/base'
	autoload :Message, 'emailvision4rails/models/message'
	autoload :Campaign, 'emailvision4rails/models/campaign'

	# Controllers
	autoload :BaseController, 'emailvision4rails/controllers/base_controller'

	ActionView::Template.register_template_handler :emv, EmvHandler	

	if defined?(Rails)
		require 'emailvision4rails/railtie'
	end
end