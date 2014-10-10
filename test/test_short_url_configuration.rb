require 'test/unit'
require 'short_url'

class TestConfiguration < Test::Unit::TestCase
  ShortUrl.configure do |config|
    config.min_length = 6
    config.alphabet = "abcd"
  end

  def test_min_length
    assert_equal 6, ShortUrl.configuration.min_length
  end

  def test_alphabet
    assert_equal "abcd", ShortUrl.configuration.alphabet
  end

  def test_block_size
    assert_equal 24, ShortUrl.configuration.block_size
  end
end
