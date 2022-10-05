module Blocks

	class << self
		def load
			colors = ["red", "green", "yellow", "blue",\
                                                   "purple", "white"]
			@objs = colors.map {|c| Tools.load_obj(c, "block")}
			@objs.shuffle!.rotate!.shuffle!
		end
	end


	class Generator
			attr_accessor :current_shape

			Shapes = ["l", "T", "plus", "straight", "square",
											 "J", "bar", "dot"]
		def initialize(win, pics)
			@win = win

			@pics = pics

			@current_shape = Set.makes @win, "straight", @pics
			@shapes = Array.new
			end
		
		def update
			@current_shape.update
			if @current_shape.idle?
					next_shape
			end	
			@shapes.each {|sh| sh.update}
		end	

		def draw
			@current_shape.draw
			@shapes.each {|ape| ape.draw}
		end

		private

		def next_shape
			@shapes.push(@current_shape)	
			@current_shape = Set.makes @win, "straight", @pics
		end
	end
end


