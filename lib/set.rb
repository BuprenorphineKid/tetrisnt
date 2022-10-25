module Blocks

	module Set

		class << self


			def the_spawns(tray)
				left = tray.x
				right = tray.width

				@spawn_spots = Array.new
				
				n = left

				until n >= right
					n = n + 63
					
					@spawn_spots.push(n)
				end
			end

			def generate(win, shape)
				@spawn_spots.shuffle!.rotate!.shuffle!

				pics = Blocks.load
				x = @spawn_spots.sample

		      placement = {block_one: {x: x, y: 0}}
		      
		      blocks = Array(pics.sample).map do |pic|

			      		Blocks::Block.new pic, win,
				      placement[:block_one][:x],
				placement[:block_one][:y]
			      end

		      case shape
		      when /[Ss][Tt][Rr][Aa][Ii][Gg][Hh][Tt]/
		      placement[:block_two] = {x: x, y:
		         placement[:block_one][:y] - blocks[0].height}

				      Array(pics.sample).map do |pic|

					   			blocks.push( 
					   	Blocks::Block.new pic, win,
	          placement[:block_two][:x],
				placement[:block_two][:y])
		         end

				placement[:block_three] = {x: x, y:
		         placement[:block_two][:y] - blocks[1].height}

		   	      Array(pics.sample).map do |pic|

					            blocks.push( 
							Blocks::Block.new pic, win,
						 placement[:block_three][:x],
				placement[:block_three][:y])
		         end

				placement[:block_four] = {x: x, y:
		         placement[:block_three][:y] - blocks[2].height}

		      	   Array(pics.sample).map do |pic|
	
									blocks.push( 
							Blocks::Block.new pic, win,
		      		placement[:block_four][:x],
				placement[:block_four][:y])
			       end	

			      return Blocks::Shape.new(blocks)
				end
		   end
		end
	end
end
	
