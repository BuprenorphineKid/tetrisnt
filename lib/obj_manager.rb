class Obj_Manager


		Shapes = {L: "L", PLUS: "plus",STRAIGHT: "straight",
						 SQUARE: "square", J: "J", BAR: "bar", DOT: "dot"}

	attr_accessor :current

	def initialize(win, tray, lines)
    @win = win
    @tray = tray
    @lines = lines
    
    @current = Blocks::Set.generate(win, Shapes[:STRAIGHT])
		@curator = Curator.new

		@active = []
		@current.blocks.each {|blk| @active.push blk}
	end

	def produce_shape
		@current.blocks.each {|obj| @active.push obj}
		@current = Blocks::Set.generate(@win, Shapes[:STRAIGHT])
	end

	def hit_scan
		@current.blocks.each do |b|
		  hit_possible? b		  
		  @possible_collisions.difference(@current.blocks).each do |o|
		    if Collision.will_collide?(b, o) || Collision.rect_in_rect?(b, o)
		    	@current.collide!
			  end
	    end
		end
	end
  
	def drop obj=@current.blocks
    y_pos = @curator.sort_y(@possible_collisions.difference(Array(obj))).first
    snap @current, y_pos
  end

  def hit_possible?(block)
      @possible_collisions = @active.select do |obj|
        obj.x == block.x
      end

      @possible_collisions.push @tray
  end
    
  def snap obj0, y_pos
     obj0.y = y_pos - obj0.height
  end

	def update
		@current.update
		if @current.idle?
			produce_shape
		end

		@active.each {|obj| obj.update}
     		hit_scan
     		
		@current.blocks.each do |w|
			if w.idle?
				@active.push @current.blocks.shift
			end
		end
	end

	def draw
		@current.draw
		@active.each {|obj| obj.draw}
	end
end
