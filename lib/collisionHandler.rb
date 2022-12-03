class CollisionHandler

  def initialize(evnt_hdlr)
    @eh = evnt_hdlr
    @possibles = []
    @curator = Curator.new
  end

  def hit_check
    @eh.current.blocks.each do |block|
      hit_possible?(block)
      @possibles.difference(@eh.current.blocks).each do |object|
        if Collision.will_collide?(block, object) ||
           Collision.rect_in_rect?(block, object);
              snap(block, object.y)
              @eh.current.collide!
        end
      end
    end
  end

  def hit_possible?(block)
    @possibles = @eh.active.select do |obj|
      obj.x == block.x
    end

    @possibles.push @eh.tray
  end

  def drop(obj=@eh.current.blocks)
    y_pos = @curator.sort_y(@possibles.difference(Array(obj))).first
    snap @eh.current, y_pos
  end

  def snap(obj, y_pos)
    obj.y = y_pos - obj.height
  end

  def update
    hit_check()

    @possibles.each {|b| b.update}
  end

  def draw()
    @possibles.each {|b| b.draw}
  end
end
