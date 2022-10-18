module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in self do
      yield i
    end
  end

  def my_each_with_index
    i = 0
    for e in self do
      yield [e, i]
      i +=1
    end
  end

  def my_select(&a_block)
    return unless block_given?

    out_put = []
    each { |e| out_put.push(e) if a_block.call(e) }
    out_put
  end

  def my_all?(&a_block)
    each { |e| return false unless a_block.call(e) }
    true
  end

  def my_any?(&a_block)
    each { |e| return true if a_block.call(e) }
    false
  end

  def my_none?(&a_block)
    each { |e| return false if a_block.call(e) }
    true
  end

  def my_count(&a_block)
    return size unless block_given?

    counter = 0
    each { |e| counter += 1 if a_block.call(e) }
    counter
  end

  def my_map(&a_block)
    result = []
    each {|e| result.push(a_block.call(e)) }
    result
  end

  def my_inject(a_start = 0, &a_block)
    each { |e| a_start = a_block.call(a_start, e) }
    a_start
  end

end
