class KillRow < Goal
  
  attr_reader :ypos
  attr_accessor :row

  def initialize(block)
    @row = [nil, nil, nil, nil, nil, nil, nil]
    @slots_x = [
      [X_VALS[0] - 1, X_VALS[1] - 1],
      [X_VALS[1] - 1, X_VALS[2] - 1],
      [X_VALS[2] - 1, X_VALS[3] - 1],
      [X_VALS[3] - 1, X_VALS[4] - 1],
      [X_VALS[4] - 1, X_VALS[5] - 1],
      [X_VALS[5] - 1, X_VALS[6] - 1],
      [X_VALS[6] - 1, X_VALS[7] - 1],
      [X_VALS[7] - 1, X_VALS[8] - 1]
    ]
    @slots_y = [
      [-63, Y_VALS[0] - 1],
      [Y_VALS[0] - 1, Y_VALS[1] - 1],
      [Y_VALS[1] - 1, Y_VALS[2] - 1],
      [Y_VALS[2] - 1, Y_VALS[3] - 1],
      [Y_VALS[3] - 1, Y_VALS[4] - 1],
      [Y_VALS[4] - 1, Y_VALS[5] - 1],
      [Y_VALS[5] - 1, Y_VALS[6] - 1],
      [Y_VALS[6] - 1, Y_VALS[7] - 1],
      [Y_VALS[7] - 1, Y_VALS[8] - 1],
      [Y_VALS[8] - 1, Y_VALS[9] - 1],
      [Y_VALS[9] - 1, Y_VALS[10] - 1],
      [Y_VALS[10] - 1, Y_VALS[11] - 1],
      [Y_VALS[11] - 1, Y_VALS[12] - 1],
      [Y_VALS[12] - 1, Y_VALS[13] - 1],
      [Y_VALS[13] - 1, Y_VALS[14] - 1],
      [Y_VALS[14] - 1, Y_VALS[15] - 1]
    ]
    @yrange = []
    determine_yrange(block)
    add(block)
  end

  def determine_yrange(block)
    @slots_y.each_with_index do |a, idx|
      a.each do |b, c|
        if block.y.in_range? b, c
          @ypos = idx
        end
      end
    end
  end

  def determine_slot(block)
    @slots_x.each_with_index do |a, idx|
      a.each do |b, c|
        if block.x.in_range? b, c &&
          block.y.in_range?(@slots_y[@ypos][0], @slots_y[@ypos][1])
          return idx
        end
      end
    end
  end

  def add(block)
    @row[determine_slot(block)] = block
  end
end
