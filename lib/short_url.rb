require 'short_url/exceptions'
require 'short_url/encoder'

module ShortUrl
  class << self
    attr_accessor :configuration, :encoder
  end

  def self.included(base)
    base.extend(ClassMethods)
    config = ShortUrl::configuration
    self.encoder ||= Encoder.new(config.alphabet, config.min_length, config.block_size)
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  def short_url
    raise ObjectHasNoId unless id
    ShortUrl::encoder.encode_url(id)
  end

  module ClassMethods
    def short_url(id)
      ShortUrl::encoder.encode_url(id)
    end

    def decode_url(key)
      ShortUrl::encoder.decode_url(key)
    end
  end

  class Configuration
    attr_accessor :alphabet, :min_length, :block_size

    def initialize
      @alphabet = 'm6nj2c4rv8bpygw95z7hsdaetxuk3fq'
      @min_length = 5
      @block_size = 24
    end
  end
end
