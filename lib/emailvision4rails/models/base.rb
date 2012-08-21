require 'active_model/conversion'
require 'active_model/attribute_methods'
require 'active_model/naming'
require 'active_model/translation'
require 'active_model/validator'
require 'active_model/validations'
require 'active_model/callbacks'

class Emailvision4rails::Base
	include ActiveModel::Conversion
	include ActiveModel::AttributeMethods
	include ActiveModel::Validations

	extend ActiveModel::Callbacks
	extend ActiveModel::Naming

	class_attribute :_attributes
	self._attributes = []

	attribute_method_suffix '?'

	define_model_callbacks :create, :update

	def self.attributes(*names)
		attr_accessor *names
		define_attribute_methods names

		self._attributes += names
	end

	def attributes
		self._attributes.inject({}) do |hash, attr|
			hash[attr.to_s] = send(attr)
			hash
		end
	end

	def persisted?
		false
	end

	def to_emv
		attributes.reject {|k,v| v.nil?}
	end

	protected

	def api
		@api ||= Emailvision::Api.new :endpoint => "apiccmd"
		@api.open_connection unless @api.connected?
		@api
	end

	def attribute?(attribute)
		send(attribute).present?
	end
end