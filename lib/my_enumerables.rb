module Enumerable
  # Your code goes here
  def my_find
    self.my_each do |elem|
      return elem if yield(elem)
    end
    nil
  end

  def my_all?
    # Iterate through each element of the collection
    self.my_each do |elem|
      # If any element doesn't satisfy the block condition, return false
      return false unless yield(elem)
    end
    # If all elements pass the block condition, return true
    true
  end

  def my_any?
    self.my_each do |elem|
      return true if yield(elem)
    end
    false
  end

  def my_count
    count = 0
    self.my_each do |elem|
      if block_given?
        count += 1 if yield(elem)
      else
      count += 1
      end
    end
    count
  end

  def my_each_with_index
    return enum_for(:my_each_with_index) unless block_given?  # Handle no block case

    index = 0  # Initialize the index
    self.my_each do |elem|  # Use my_each to loop over elements
      yield elem, index  # Yield both the element and its index
      index += 1  # Increment the index after each element
    end
    self  # Return the array, for chaining
  end

  def my_inject(initial = 0)
    total = initial   
    self.my_each do |elem|
      total = yield(total, elem)    
    end
    total
  end

  def my_map
    new_array = []
    self.my_each do |elem|
      if block_given?
        yield(elem)
        new_array << yield(elem)
      end
    end
    new_array
end



  def my_none?
    self.my_each do |elem|
      return false if yield (elem)
    end
    true
  end

  def my_select
    matches = []
    self.my_each do |elem|
       matches << elem if yield (elem)
    end
    matches
  end


end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    # Iterate over the array and yield each element to the block
    for elem in self
      yield(elem)
    end
    self  # Ensure my_each returns the array itself for chaining
  end
end
