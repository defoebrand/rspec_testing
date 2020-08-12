class Player
  attr_reader :player_name, :symbol, :position
  def initialize(player_name, symbol)
    @player_name = player_name
    @symbol = symbol
    @position = []
  end

  def add_pos(pos)
    @position.push(pos)
  end
end
