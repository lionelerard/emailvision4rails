require 'rails'

require 'active_model/conversion'
require 'active_model/attribute_methods'
require 'active_model/validations'
require 'active_model/callbacks'

require 'abstract_controller/rendering'
require 'abstract_controller/collector'

module Emailvision
	autoload :EmvHandler, 'emailvision/emv_handler'

	# Models
	autoload :Base, 'emailvision/models/base'
	autoload :Message, 'emailvision/models/message'
	autoload :Campaign, 'emailvision/models/campaign'

	# Controllers
	autoload :BaseController, 'emailvision/controllers/base_controller'

	ActionView::Template.register_template_handler :emv, EmvHandler
end