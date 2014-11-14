module Insightly
  module Errors
    class ClientError < StandardError
      def initialize(response)
        super(response)
      end
    end
  end
end
