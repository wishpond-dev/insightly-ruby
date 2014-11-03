require 'insightly/version'

module Insightly
  autoload :Client, 'insightly/client'
  autoload :DSL, 'insightly/dsl'
  autoload :Resources, 'insightly/resources'
  autoload :Errors, 'insightly/errors'
  autoload :Utils, 'insightly/utils'

  class << self
    # @return [String]
    attr_accessor :api_key
    attr_accessor :logger
  end

  # @return [Insightly::Client]
  def new(api_key)
    Client.new(api_key)
  end

end
