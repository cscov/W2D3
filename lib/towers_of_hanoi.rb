class TowersOfHanoi

  attr_reader :towers

  def initialize(towers = [[3, 2, 1], [], []])
    @towers = towers
  end

  def won?
    return false if !towers[0].empty?
    towers.any? { |tower| tower.length == 3 }
  end



  def move(from_tower, to_tower)
    raise InvalidMoveError if towers[from_tower].empty?
    raise InvalidMoveError if towers[from_tower].last > towers[to_tower].last

    disk_to_move = towers[from_tower].pop
    towers[to_tower] << disk_to_move

    self
  end

end

class InvalidMoveError < StandardError
end
