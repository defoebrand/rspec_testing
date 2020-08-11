
require './lib/player'
require './lib/gameboard'
describe Player do
  let(:player) { Player.new("Eric", "X") }
  let (:position ) { [1] }

it 'Test player name' do
    expect(player.player_name).to eql("Eric")
end
it 'Test player name' do
  expect(player.player_name).not_to eql("Done")
end
it 'Test player symbol' do
  expect(player.symbol).to eql("X")
end
it 'Test player symbol' do
  expect(player.symbol).not_to eql("Y")
end
describe '#add_pos' do
    it 'Test if the array contains expected value' do
      expect(player.add_pos(1)[0]).to eql(position[0])
    end
end
 

end

describe GameBoard do
    let(:player1) { Player.new("Eric", "X") }
    let(:player2) { Player.new("Jhone", "O") }
    let (:game_board) {GameBoard.new(player1, player2)}
    let (:board) { [['X', ' | ', '2', ' | ', '3'],
    ['+', ' - ', '+', ' - ', '+'],
    ['4', ' | ', '5', ' | ', '6'],
    ['+', ' - ', '+', ' - ', '+'],
    ['7', ' | ', '8', ' | ', '9']]}

    it 'Test player name' do
        expect(player1.player_name).to eql("Eric")
    end
    it 'Test player name' do
    expect(player1.player_name).not_to eql("Done")
    end
    it 'Test player symbol' do
    expect(player1.symbol).to eql("X")
    end
    it 'Test player symbol' do
    expect(player1.symbol).not_to eql("Y")
    end


    it 'Test player name' do
        expect(player2.player_name).to eql("Jhone")
    end
    it 'Test player name' do
    expect(player2.player_name).not_to eql("Done")
    end
    it 'Test player symbol' do
    expect(player2.symbol).to eql("O")
    end
    it 'Test player symbol' do
    expect(player2.symbol).not_to eql("Y")
    end
    describe '#display_board' do
        it 'Check if the method displays the board' do
        expect(game_board.display_board).to eql(board.each do |arr|  
            arr.length.times { |i| print arr[i] } 
            puts
        end )
        end
    end

    describe '#update_board' do
        it 'Replace the given position on the game board' do
        expect(game_board.update_board(1, player1)).to eql(board[0][0])
    end
end
    
end