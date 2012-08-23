module Emailvision4rails
  class Premailer < ::Premailer
    def initialize(html)
      ::Premailer.send(:include, Adapter.find(Adapter.use))

      encoding = Configuration.encoding.try(:upcase)
      options = {
        :adapter => :hpricot,
        :warn_level => Premailer::Warnings::SAFE,
        :with_html_string => true,
        :encoding => encoding,
        :input_encoding => encoding,
        :inputencoding => encoding
      }

      super(html, options)
    end
  end
end