require './lib/player'
require './lib/gameboard'

describe Player do
  let(:player) { Player.new('Eric', 'X') }
  let(:position) { [1] }
  let(:player1) { Player.new('Eric', 'X') }

  it 'Test player name' do
    expect(player.player_name).to eql('Eric')
  end

  it 'Test player name' do
    expect(player.player_name).not_to eql('Done')
  end

  it 'Test player symbol' do
    expect(player.symbol).to eql('X')
  end

  it 'Test player symbol' do
    expect(player.symbol).not_to eql('Y')
  end

  describe '#add_pos' do
    it 'Test if the array contains expected value' do
      expect(player.add_pos(1)[0]).to eql(position[0])
    end
  end
end

describe GameBoard do
  let(:player1) { Player.new('Eric', 'X') }
  let(:player2) { Player.new('Jhone', 'O') }
  let(:player1_position) { player1.position }
  let(:position) { [1, 4, 5, 7] }
  let(:player_one_moves) { [1, 3, 5, 6] }
  let(:player_two_moves) { [4, 7, 9, 8] }
  let(:game_board) { GameBoard.new(player1, player2) }
  let(:winning_position) do
    [[1, 2, 3],
     [4, 5, 6],
     [7, 8, 9],
     [1, 4, 7],
     [2, 5, 8],
     [3, 6, 9],
     [1, 5, 9],
     [3, 5, 7]]
  end
  let(:board) do
    [['X', ' | ', '2', ' | ', '3'],
     ['+', ' - ', '+', ' - ', '+'],
     ['4', ' | ', '5', ' | ', '6'],
     ['+', ' - ', '+', ' - ', '+'],
     ['7', ' | ', '8', ' | ', '9']]
  end
  let(:actual_game_board) do
    [['1', ' | ', '2', ' | ', '3'],
     ['+', ' - ', '+', ' - ', '+'],
     ['4', ' | ', '5', ' | ', '6'],
     ['+', ' - ', '+', ' - ', '+'],
     ['7', ' | ', '8', ' | ', '9']]
  end

  it 'Test player name' do
    expect(player1.player_name).to eql('Eric')
  end

  it 'Test player name' do
    expect(player1.player_name).not_to eql('Done')
  end

  it 'Test player symbol' do
    expect(player1.symbol).to eql('X')
  end

  it 'Test player symbol' do
    expect(player1.symbol).not_to eql('Y')
  end

  it 'Test player name' do
    expect(player2.player_name).to eql('Jhone')
  end

  it 'Test player name' do
    expect(player2.player_name).not_to eql('Done')
  end

  it 'Test player symbol' do
    expect(player2.symbol).to eql('O')
  end

  it 'Test player symbol' do
    expect(player2.symbol).not_to eql('Y')
  end

  describe '#display_board' do
    it 'Check if the method displays the board' do
      expect(game_board.display_board).to eql(actual_game_board)
    end
    it 'Check if the method displays the board' do
      expect(game_board.display_board).not_to eql(board)
    end
  end

  describe '#update_board' do
    it 'Replace the given position on the game board' do
      expect(game_board.update_board(1, player1)).to eql(board[0][0])
    end
    it 'Replace the given position on the game board' do
      expect(game_board.update_board(1, player2)).not_to eql(board[0][0])
    end
  end

  describe '#check_pos?' do
    it 'Check if position is taken' do
      player1.add_pos(2)
      expect(game_board.check_pos?(2)).to eql(true)
    end
    it 'Check if position is taken' do
      player1.add_pos(2)
      expect(game_board.check_pos?(3)).not_to eql(true)
    end
  end

  describe '#check_winner?' do
    it 'Check a winner' do
      player1.add_pos(1)
      player1.add_pos(2)
      player1.add_pos(3)
      expect(game_board.check_winner?(player1)).to eql(true)
    end
    it 'Check a winner' do
      player1.add_pos(4)
      player1.add_pos(2)
      player1.add_pos(3)
      expect(game_board.check_winner?(player1)).not_to eql(true)
    end
  end
end
