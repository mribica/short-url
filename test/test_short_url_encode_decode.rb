require 'test/unit'
require 'short_url'

class Target
  include ShortUrl
end

class TargetWithId
  include ShortUrl

  def id 
    12
  end
end

class TestEncodeDecode < Test::Unit::TestCase
  def test_encode_decode
    encoded_url = Target.short_url(12)
    assert_equal 12, Target.decode_url(encoded_url)
  end

  def test_instance_short_url_exception
    assert_raises ObjectHasNoId do
      Target.new.short_url
    end
  end

  def test_instance_short_url
    assert_nothing_raised ObjectHasNoId do
      TargetWithId.new.short_url
    end
  end
end
