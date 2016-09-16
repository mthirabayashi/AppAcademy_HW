
class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    included = false
    @map.each_with_index do |pair,i|
      if pair[0]==key
        @map[i][1] = value
        included = true
      end
    end
    @map << [key, value] if not included
  end

  def lookup(key)
    @map.each do |pair|
      puts "value of #{key} is = #{pair.last}" if pair[0]==key
      return pair[1] if pair[0]==key
    end
  end

  def remove(key)
    @map.each do |pair|
      @map.delete(pair) if key==pair[0]
    end
  end

  def show
    puts "The current Map is: #{@map}"
  end

end
