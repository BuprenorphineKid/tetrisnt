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
		attr_accessor :shape
			Shapes = ["l", "T", "plus", "straight", "square",\
										 "J", "bar", "dot"]

		def initialize(win, pics)
			@win = win

			@blocks = Array.new

			@pics = pics

			start
		end

		def assemble(shape)
			x = Gosu.random(0, @win.width)
			placement = {block_one: {x: x, y: 0}}				
			@pics.shuffle!.rotate!.shuffle!.take(1)
			.map do |pic|
				@blocks.push(Blocks::Block.new pic, @win,
						placement[:block_one][:x],
							placement[:block_one][:y])
			end
			case shape
			when /[Ss][Tt][Rr][Aa][Ii][Gg][Hh][Tt]/
				placement[:block_two] = {x: x, y: (placement[:block_one][:y] + (@blocks[0].top))}
				@pics.shuffle!.rotate!.shuffle!.take(1)
				.map do |pic|	
					@blocks.push(Blocks::Block.new pic, @win,	
							placement[:block_two][:x],
								placement[:block_two][:y])
				end																
				placement[:block_three] = {x: x, y: (placement[:block_two][:y] + (@blocks[1].top))}
				@pics.shuffle!.rotate!.shuffle!.take(1)
				.map do |pic|
					@blocks.push(Blocks::Block.new pic, @win,	
							placement[:block_three][:x],
								placement[:block_three][:y])
				end
				placement[:block_four] = {x: x, y: (placement[:block_three][:y] + (@blocks[2].top))}
				@pics.shuffle!.rotate!.shuffle!.take(1)	
				.map do |pic|
					@blocks.push(Blocks::Block.new pic, @win,
							placement[:block_four][:x],
								placement[:block_four][:y])
				end		
			when /[Tt]/
				placement[:block_two] = {x: x, y: (placement[:block_one][:y] + (@blocks[0].top))}
				@pics.shuffle!.rotate!.shuffle!.take(1)
				.map do |pic|	
					@blocks.push(Blocks::Block.new pic, @win,	
							placement[:block_two][:x],
								placement[:block_two][:y])
				end																
				placement[:block_three] = {x: x, y: (placement[:block_two][:y] + (@blocks[1].top))}
				@pics.shuffle!.rotate!.shuffle!.take(1)
				.map do |pic|
					@blocks.push(Blocks::Block.new pic, @win,	
							placement[:block_three][:x],
								placement[:block_three][:y])
				end
				placement[:block_four] = {x: x, y: (placement[:block_three][:y] + (@blocks[2].top))}
				@pics.shuffle!.rotate!.shuffle!.take(1)	
				.map do |pic|
					@blocks.push(Blocks::Block.new pic, @win,
							placement[:block_four][:x],
								placement[:block_four][:y])
				end
			when /[Bb][Aa][Rr]/
				placement[:block_two] = {x: x, y: (placement[:block_one][:y] + (@blocks[0].top))}
				@pics.shuffle!.rotate!.shuffle!.take(1)
				.map do |pic|	
					@blocks.push(Blocks::Block.new pic, @win,	
							placement[:block_two][:x],
								placement[:block_two][:y])
				end																
				placement[:block_three] = {x: x, y: (placement[:block_two][:y] + (@blocks[1].top))}
				@pics.shuffle!.rotate!.shuffle!.take(1)
				.map do |pic|	
					@blocks.push(Blocks::Block.new pic, @win,	
			
							placement[:block_three][:x],
								placement[:block_three][:y])
				end
				placement[:block_four] = {x: x, y: (placement[:block_three][:y] + (@blocks[2].top))}
				@pics.shuffle!.rotate!.shuffle!.take(1)	
				.map do |pic|
					@blocks.push(Blocks::Block.new pic, @win,
							placement[:block_four][:x],
								placement[:block_four][:y])
				end
			when /[Pp]lus/
				placement[:block_two] = {x: x, y: (placement[:block_one][:y] + (@blocks[0].top))}
				@pics.shuffle!.rotate!.shuffle!.take(1)
				.map do |pic|	
					@blocks.push(Blocks::Block.new pic, @win,	
							placement[:block_two][:x],
								placement[:block_two][:y])
				end																
				placement[:block_three] = {x: x, y: (placement[:block_two][:y] + (@blocks[1].top))}
				@pics.shuffle!.rotate!.shuffle!.take(1)
				.map do |pic|
					@blocks.push(Blocks::Block.new pic, @win,	
							placement[:block_three][:x],
								placement[:block_three][:y])
				end
				placement[:block_four] = {x: x, y: (placement[:block_three][:y] + (@blocks[2].top))}
				@pics.shuffle!.rotate!.shuffle!.take(1)	
				.map do |pic|
					@blocks.push(Blocks::Block.new pic, @win,
							placement[:block_four][:x],
								placement[:block_four][:y])
				end
  			end
		end
		
		def update
			if @shape.idle?
				assemble "straight"
			end
			@shape.update
		end	

		def draw
			@blocks.each {|k| k.draw}	
		end

		private

		def start
			assemble("Straight")
			@shape = Shape.new(@blocks, "straight")
		end
	end
end


