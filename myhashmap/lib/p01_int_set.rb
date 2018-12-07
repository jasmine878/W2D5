require 'byebug'

class MaxIntSet
  def initialize(max)
    # @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if num > @store.length || num < 0

    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    return false unless @store[num]
    true
  end

  private

  def is_valid?(num)

  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    return false if self[num].empty?
    true
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    #use bracket method so you don't have to keep repeating the modulo calculation
    #to find out i
    i = num % @store.length
    @store[i]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    #@store is the set (skeleton)
    #count is the data we're stoing in the set
    #when we initialize, there's no data in our set.
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    #we resize as soon as our data count reaches the # of buckets
    # we may have some empty buckets because buckets can store more than 1 number
     resize! if @count == num_buckets

      unless self.include?(num)
        self[num] << num
        @count += 1
      end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    # debugger
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
     i = num % @store.length
    @store[i]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) { Array.new }

    @store.each do |sub_arr|
      sub_arr.each do |ele|
        new_store[ele % new_store.length] << ele
      end
    end
      @store = new_store
  end
end
