class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count == num_buckets

    #.hash converts key to a unique combination of numbers
    #.hash is a unique identifier
    #But we shovel in the key into the bucket location, not the unique identifier
      unless self.include?(key.hash)
        self[key.hash] << key
        @count += 1
      end
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    if self.include?(key)
      self[key.hash].delete(key)
      @count -= 1
    end
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
      sub_arr.each do |key|
        new_store[key.hash % new_store.length] << key
      end
    end
      @store = new_store
  end
end
