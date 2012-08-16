module Emailvision #:nodoc:
  class Collector
    include AbstractController::Collector
    attr_reader :responses

    def initialize(context, &block)
      @context = context
      @responses = []
      @default_render = block
    end
  end
end