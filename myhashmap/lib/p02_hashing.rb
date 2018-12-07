class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash_result = ""
    self.each_with_index do |ele, idx|
      hash_result << ele * (idx + 1)
    end
    hash_result.to_i
  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
