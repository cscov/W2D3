require 'first_tdd'
require 'rspec'

RSpec.describe 'Array' do
  describe '#remove_dups' do

    let(:barney) { [1, 2, 2, 5, 4, 6, 6, 7] }

    it "should return an array" do
      expect(barney.remove_dups).to be_an_instance_of(Array)
    end

    it "should not modify the original array" do
      barney.remove_dups
      expect(barney).to be(barney)
    end

    it "should return a unique array" do
      expect(barney.remove_dups).to eq([1, 2, 5, 4, 6, 7])
    end
  end

  describe '#two_sum' do
    let(:sam) { [-1, 0, 2, -2, 1] }
    let (:bob) { [2, 3, 4] }


    it "returns an empty array if no pairs sum to zero" do
      expect(bob.two_sum).to eq([])
    end

    it "sorts sub-arrays dictionary-wise" do
      expect(sam.two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe '#my_transpose' do

    let(:frank) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }

    it "correctly transposes an array" do
      expect(frank.my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end
  end

  describe '#stock_picker'

  let(:spot) { [4, 6, 56, 3, 11, 27, 42]}

  it 'returns an array of length 2' do
    expect(spot.stock_picker.length). to eq(2)
  end

  it 'cannot return a sell date that is before the buy date' do
    expect(spot.stock_picker[0]).to be < spot.stock_picker[1]
  end

  it 'returns the most profitable pair of dates' do
    expect(spot.stock_picker).to eq([0, 2])
  end
end
