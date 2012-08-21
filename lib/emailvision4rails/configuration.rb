module Emailvision4rails
	class Configuration

		class << self
			attr_accessor :server_name, :endpoint, :login, :password, :key, :debug
		end		

	end
end