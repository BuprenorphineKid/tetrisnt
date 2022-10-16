class Shape_Manager

	Shapes = {L: "L", T: "T", PLUS: "plus",STRAIGHT: "straight",
					 SQUARE: "square", J: "J", BAR: "bar", DOT: "dot"}

	attr_accessor :current_shape

	def initialize(win)
		
		@current_shape = Blocks::Set.generate(win, Shapes[:STRAIGHT])
		@active_shapes = []
		@num = 0		
		@win = win
	end

	def produce
		@active_shapes.push @current_shape
		@current_shape = Blocks::Set.generate(@win, Shapes[:STRAIGHT])
	end
				
	def update
		@current_shape.update

		if @active_shapes.any?
			Collision.detect(@current_shape, @active_shapes[@num % @active_shapes.size])
		end
		
		if @current_shape.idle?
			produce
		end
		@active_shapes.each {|shape| shape.update}
		@num += 1
	end

	def draw
		@current_shape.draw
		@active_shapes.each {|shape| shape.draw}
	end

end
