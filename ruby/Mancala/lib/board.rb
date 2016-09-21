class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      @cups[i] = [:stone, :stone, :stone, :stone] unless i==6 || i==13
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos<1
    raise "Invalid starting cup" if start_pos>12
    return false if start_pos == 6 || start_pos == 13
    true
  end

  def make_move(start_pos, current_player_name)
    # puts "Current Start pos is: #{start_pos}"
    # puts "Current Player is: #{current_player_name}"
    stones_in_cup = @cups[start_pos]

    @cups[start_pos] = []
    until stones_in_cup.empty?
      stone = stones_in_cup.last
      start_pos = (start_pos+1) % 14
      if start_pos == 6 #player1 bucket
        start_pos = (start_pos+1) % 14 if current_player_name==@player2
      end
      if start_pos == 13 #player2 bucket
        start_pos = (start_pos+1) % 14 if current_player_name==@player1
      end
      @cups[start_pos] << stones_in_cup.pop
    end
    render
    next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6
      return :prompt
    elsif ending_cup_idx == 13
      return :prompt
    end
    if @cups[ending_cup_idx].size == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    side1 = @cups[0..5]
    side2 = @cups[7..12]
    s1_empty = true
    s2_empty = true
    side1.each do |cup|
      s1_empty = false if !cup.empty?
    end
    side2.each do |cup|
      s2_empty = false if !cup.empty?
    end
    s1_empty || s2_empty
  end

  def winner
    return @player1 if @cups[6].size > @cups[13].size
    return @player2 if @cups[6].size < @cups[13].size
    :draw
  end
end
