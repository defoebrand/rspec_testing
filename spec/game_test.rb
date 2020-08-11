
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
    let(:player) { Player.new("Eric", "X") }
    let (:position ) { [1] }
  
  it 'Test player name' do
      expect(player.player_name).to eql("Eric")
  end
end