class Emailvision::Base
	include ActiveModel::Conversion
	include ActiveModel::AttributeMethods
	include ActiveModel::Validations
	include ActiveModel::Callbacks

	extend ActiveModel::Naming

	class_attribute :_attributes
	self._attributes = []

	attribute_method_suffix '?'

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
		attributes_present = attributes.reject {|k,v| v.nil?}
		{:message => attributes_present}
	end

	protected

	def api
		@api ||= Emailvision::Api.new :endpoint => "apiccmd"
		@api.open_connection unless @emv.connected?
	end

	def attribute?(attribute)
		send(attribute).present?
	end
end