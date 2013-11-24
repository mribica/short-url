require 'short_url/exceptions'
require 'short_url/encoder'

module ShortUrl
  def self.included(base)
    base.extend(ClassMethods)
  end

  def short_url
    raise ObjectHasNoId unless id
    Encoder.new.encode_url(id)
  end

  module ClassMethods
    def generate_short_url(id)
      Encoder.new.encode_url(id)
    end
  end
end

