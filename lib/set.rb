module Blocks

	module Set

		class << self


			def the_spawns(tray)
 				left = tray.x
				right = tray.width

				@spawn_spots = Array.new
				
				n = left

				until n >= right
					@spawn_spots.push(n)
					n += 63
					
				end
				return @spawn_spots
			end

			def generate(win, shape)
				## @spawn_spots.shuffle!.rotate!.shuffle!

				pics = Blocks.load
				x = @spawn_spots.sample
				blocks = Array.new

		      placement = {block_one: {x: x, y: 0}}
		      

			          blocks.push(
			        Blocks::Block.new pics.sample, win,
				    placement[:block_one][:x],
				placement[:block_one][:y])

		      case shape
		      when /[Ss][Tt][Rr][Aa][Ii][Gg][Hh][Tt]/
		      placement[:block_two] = {x: x, y:
		         placement[:block_one][:y] - blocks[0].height}


					   		blocks.push( 
					   	Blocks::Block.new pics.sample, win,
	          placement[:block_two][:x],
				placement[:block_two][:y])

				placement[:block_three] = {x: x, y:
		         placement[:block_two][:y] - blocks[1].height}


					       blocks.push( 
							Blocks::Block.new pics.sample, win,
						placement[:block_three][:x],
				placement[:block_three][:y])

				placement[:block_four] = {x: x, y:
		         placement[:block_three][:y] - blocks[2].height}

	
								blocks.push( 
							Blocks::Block.new pics.sample, win,
		      	placement[:block_four][:x],
				placement[:block_four][:y])

			      return Blocks::Shape.new(blocks)
				end
		   end
		end
	end
end
	
