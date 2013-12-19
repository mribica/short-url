DEFAULT_ALPHABET = 'mn6j2c4rv8bpygw95z7hsdaetxuk3fq'
MIN_LENGTH = 5
DEFAULT_BLOCK_SIZE = 24

class Encoder
  def initialize(alphabet = DEFAULT_ALPHABET, min_length = MIN_LENGTH, block_size = DEFAULT_BLOCK_SIZE)
    @alphabet = alphabet
    @min_length = min_length
    @block_size = block_size
    @mask = (1 << block_size) - 1
    @mapping = (0..block_size - 1).to_a.reverse
  end

  def encode_url(n)
    enbase(encode(n))
  end

  def decode_url(n)
    decode(debase(n))
  end

  def encode(n)
    e = (n & ~@mask) | _encode(n & @mask)
  end

  def _encode(n)
    result = 0
    for b, i in @mapping.each_with_index
      unless (n & (1 << i)) == 0
        result |= (1 << b)
      end
    end
    result
  end

  def decode(n)
    n & ~@mask | _decode(n & @mask) 
  end
  
  def _decode(n)
    result = 0
    for i, b in @mapping.each_with_index
      unless (n & (1 << b)) == 0
        result |= (1 << i)
      end
    end
    result
  end

  def enbase(x)
    result = _enbase(x)
    diff = @min_length - result.length
    unless diff < 0
      padding = @alphabet[0] * (@min_length - result.length)
    else
      padding = ''
    end
    "#{padding}#{result}"
  end

  def _enbase(x)
    n = @alphabet.length
    if x < n
      return @alphabet[x]
    end
    return _enbase(x / n) + @alphabet[x % n]
  end

  def debase(x)
    n = @alphabet.length
    result = 0
    for c, i in x.reverse.split('').each_with_index do
      result += @alphabet.split('').index(c) * (n ** i)
    end
    result
  end
end
