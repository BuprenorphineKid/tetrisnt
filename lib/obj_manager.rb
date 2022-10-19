class Obj_Manager

	Shapes = {L: "L", PLUS: "plus",STRAIGHT: "straight",
					 SQUARE: "square", J: "J", BAR: "bar", DOT: "dot"}

	attr_accessor :current

	def initialize(win)

		@current = Blocks::Set.generate(win, Shapes[:STRAIGHT])

		@active = []

		@current.blocks.each {|blk| @active.push blk}
		@num = @active.size
		@win = win

		@num = 1
	end

	def produce_shape
		@current.blocks.each {|obj| @active.push obj}
		@current = Blocks::Set.generate(@win, Shapes[:STRAIGHT])
	end

	def hit_scan
		@current.blocks.each do |b|
			@active.difference(@current.blocks).each do |o|
				if Collision.rect_in_rect? b, o
					b.collide!
				end
			end
		end
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
