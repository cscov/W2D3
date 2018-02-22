class Array
  def remove_dups
    no_dups = []

    self.each do |element|
      no_dups << element if !no_dups.include?(element)
    end
    no_dups
  end

  def two_sum
    results = []
    self.each_with_index do |element, idx1|
      self.each_with_index do |element2, idx2|
        if idx2 <= idx1
          next
        elsif element + element2 == 0
          results << [idx1, idx2]
        end
      end
    end

    results
  end

  def my_transpose
    transposed_hsh = Hash.new { |h, k| h[k] = [] }
    self.each do |row|
      row.each_with_index do |col, idx|
        transposed_hsh[idx] << col
      end
    end
    transposed_hsh.values
  end

  def stock_picker
    pairs_hash = Hash.new { |h, k| h[k] = [] }
    self.each_with_index do |price1, idx1|
      self.each_with_index do |price2, idx2|
        next if idx2 <= idx1
        pairs_hash[([idx1, idx2])] << (price2 - price1)
      end
    end
    differences = pairs_hash.to_a
    differences.sort_by { |el| el[1]}.last[0]
  end

end
