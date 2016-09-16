class Stack
  def initialize
    # create ivar to store stack here!
    @stack = []
  end

  def add(el)
    # adds an element to the stack
    @stack << el
  end

  def remove
    # removes one element from the stack
    @stack.pop
  end

  def show
    # return a copy of the stack
    puts "The current stack is #{@stack}"
  end
end

s = Stack.new
s.add(1)
s.show
s.add(2)
s.show
s.add(3)
s.show
s.add(4)
s.show
s.remove
s.show
s.remove
s.show
