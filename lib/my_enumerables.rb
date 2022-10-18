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

end
