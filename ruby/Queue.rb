
class Queue
  def initialize
    # create ivar to store stack here!
    @queue = []
  end

  def enqueue(el)
    # adds an element to the stack
    @queue << el
  end

  def dequeue
    # removes one element from the stack
    @queue.shift
  end

  def show
    # return a copy of the stack
    puts "The current queue is #{@queue}"
  end
end
