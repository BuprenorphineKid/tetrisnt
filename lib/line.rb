class Line

 attr_reader :slot

  def initialize y, pos 
    @y = y
    @pos = pos
      @slot = {
      one: nil,
      two: nil,
      three: nil,
      four: nil,
      five: nil,
      six: nil,
      seven: nil
    }
  end

  def  fill_slot slot, block=nil
    @slot[slot.to_sym] = block
  end

  def clear
    @slot.clear
  end
end
