
class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    included = false
    @map.each_with_index do |pair,i|
      if pair[0]==key.to_sym
        @map[i][1] = value
        included = true
      end
    end
    @map << [key.to_sym, value] if not included
  end

  def lookup(key)
    @map.each do |pair|
      puts "value of #{key} is = #{pair.last}" if pair.first==key.to_sym
      return pair.last if pair.first.to_sym==key
    end
  end

  def remove(key)
    @map.each do |pair|
      @map.delete(pair) if key.to_sym==pair[0]
    end
  end

  def show
    puts "The current Map is: #{@map}"
  end

end
