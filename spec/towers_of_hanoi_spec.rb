require "towers_of_hanoi"

RSpec.describe "towers_of_hanoi" do
  subject(:game) { TowersOfHanoi.new }

  describe '#initialize' do

    it 'initializes with towers' do
      expect(game.towers).to be_an_instance_of(Array)
    end

    it 'creates three towers' do
      expect(game.towers).to eq([[3, 2, 1], [], []])
    end
  end

  describe '#won' do
    let(:partial_towers) { TowersOfHanoi.new([[1], [2], [3]]) }
    let(:winning_tower) { TowersOfHanoi.new([[], [], [3, 2, 1]]) }

    it 'returns false if tower 0 is not empty' do
      expect(game.won?).to be(false)
    end

    it 'returns false if any tower has a length of 1 or 2' do
      expect(partial_towers.won?).to be(false)
    end

    it 'returns true if tower 1 or tower 2 has a length of 3' do
      expect(winning_tower.won?).to be(true)
    end
  end

  describe '#move'do
  let(:tower_mismatch) { TowersOfHanoi.new([[3], [2, 1], []])}
  let(:valid_tower) { TowersOfHanoi.new([[3, 1], [2], []])}
    it 'raises an error if the move is not valid' do
      expect {tower_mismatch.move(2, 0)}.to raise_error(InvalidMoveError)
    end

    it 'raises an error if the tower you are moving from has a larger
    disk on top than the tower you are moving to' do
      expect { tower_mismatch.move(0, 1)}.to raise_error(InvalidMoveError)
    end

    it 'moves the disk if the move is valid' do
      new_tower = tower_mismatch.move(1, 0)
      expect(new_tower.towers).to eq(valid_tower.towers)
    end
  end
end
