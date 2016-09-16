
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
puts "\n\n"
qu = Queue.new
qu.enqueue(1)
qu.show
qu.enqueue(2)
qu.show
qu.enqueue(3)
qu.show
qu.enqueue(4)
qu.show
qu.dequeue
qu.show
qu.dequeue
qu.show
qu.dequeue
qu.show
