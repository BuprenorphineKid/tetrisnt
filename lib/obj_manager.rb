class Obj_Manager


	Shapes = {L: "L", PLUS: "plus",STRAIGHT: "straight",
					 SQUARE: "square", J: "J", BAR: "bar", DOT: "dot"}

	attr_accessor :current

	def initialize(win)

		@current = Blocks::Set.generate(win, Shapes[:STRAIGHT])
					
		@active_objs = []
		@current.blocks.each {|blk| @active_objs.push blk}
		@num = @active_objs.size
		@win = win
	end

	def produce_shape
		@current.blocks.each {|obj| @active_objs.push obj}
		@current = Blocks::Set.generate(@win, Shapes[:STRAIGHT])
	end

	def update
		@current.update
		@active_objs.each do |obj| 
			obj.update
				if Collision.rect_in_rect? block, obj 
					block.collide!
				end
			end
		end
			
		if @current.idle?
			produce_shape
		end
		@num += 1
		
	end

	def draw
		@current.draw
		@active_objs.each {|obj| obj.draw}
	end
end
