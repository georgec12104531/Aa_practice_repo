class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    starting_cups = (0..5).to_a + (7..12).to_a
    starting_cups.each do |idx|
      @cups[idx] += [:stone, :stone, :stone, :stone]
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise  "Starting cup is empty" if @cups[start_pos].empty?
  end


  


  def make_move(start_pos, current_player_name)
    stone_in_hand = @cups[start_pos]
    @cups[start_pos] = []

    until stone_in_hand.empty?
      start_pos += 1
      current_stone = stone_in_hand.pop
      @cups[start_pos].push(current_stone)
    end


  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def renders
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end

# if __FILE__ == $0
#   p b = Board.new
# end
