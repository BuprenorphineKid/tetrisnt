class Curator

  def initialize
    @vals = []
  end

  def x_max(blocks)
    @vals = blocks.map {|b| b.x}
    @vals.max
  end

  def y_max(blocks)
    @vals = blocks.map {|b| b.y}
    @vals.max
  end

  def x_min(blocks)
    @vals = blocks.map {|b| b.x}
    @vals.min
  end

  def y_min(blocks)
    @vals = blocks.map {|b| b.y}
    @vals.min
  end

  def sort_y blocks  
   @vals = blocks.map {|b| b.y}
   return @vals.sort!
  end

  def sort_x blocks  
   @vals = blocks.map {|b| b.x}
   return @vals.sort!.reverse!
  end
end
