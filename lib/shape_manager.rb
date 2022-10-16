class Shape_Manager

	Shapes = {L: "L", T: "T", PLUS: "plus",STRAIGHT: "straight",
					 SQUARE: "square", J: "J", BAR: "bar", DOT: "dot"}

	attr_accessor :current

	def initialize(win)
		
		@current = Blocks::Set.generate(win, Shapes[:STRAIGHT])
		@active_shapes = []
		@num = 0		
		@win = win
	end

	def produce
		@active_shapes.push @current
		@current = Blocks::Set.generate(@win, Shapes[:STRAIGHT])
	end
				
	def update
		@current.update
		if @active_shapes.any?
		end
		
		if @current.idle?
			produce
		end
		@active_shapes.each {|shape| shape.update}
	end

	def draw
		@current.draw
		@active_shapes.each {|shape| shape.draw}
	end
end
