require 'byebug'

class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  #NOT a normal hash.  This is a hashmap.
  #we use a hash to come up with unique combinations to represent an Array
  def hash
    hash_result = ""
    self.each_with_index do |ele, idx|
      if ele.is_a?(Symbol)
        hash_result << (ele.to_s.ord * (idx + 1)).to_s
      elsif !ele.is_a?(Integer)
        hash_result << (ele.ord * (idx + 1)).to_s
      else
        hash_result << (ele * (idx + 1)).to_s
      end
    end
    hash_result.to_i
  end
end

class String
  #NOT a normal hash.  This is a hashmap.
  #we use a hash to come up with unique combinations to represent an String
  def hash
    alphabet = ("a".."z").to_a + ("A".."Z").to_a
    arr = []
    self.each_char.with_index do |letter, idx|
      arr << alphabet.index(letter)
    end
    arr.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort.flatten.hash
  end
end
