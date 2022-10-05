module Set

	def self.makes(win, shape, pics)
		right_Bounds = (win.traypic.width * win.tray.scalex) * 0.21
      left_Bounds = (win.traypic.height * win.tray.scaley) * 0.3

      x = Gosu.random(left_Bounds.to_i, right_Bounds.to_i)

      placement = {block_one: {x: x, y: 0}}
      blocks = pics.shuffle!.rotate!.shuffle!.take(1)
      .map do |pic|
            Blocks::Block.new pic, win,
               placement[:block_one][:x],
                  placement[:block_one][:y]
      end
      case shape
      when /[Ss][Tt][Rr][Aa][Ii][Gg][Hh][Tt]/
         placement[:block_two] = {x: x, y: (placement[:block_one][:y] + (blocks[0].top))}
         pics.shuffle!.rotate!.shuffle!.take(1)
         .map do |pic|
            blocks.push(Blocks::Block.new pic, win,
                  placement[:block_two][:x],
                     placement[:block_two][:y])
         end
         placement[:block_three] = {x: x, y: (placement[:block_two][:y] + (blocks[1].top))}
         pics.shuffle!.rotate!.shuffle!.take(1)
         .map do |pic|
            blocks.push(Blocks::Block.new pic, win,
                  placement[:block_three][:x],
                     placement[:block_three][:y])
         end
         placement[:block_four] = {x: x, y: (placement[:block_three][:y] + (blocks[2].top))}
         pics.shuffle!.rotate!.shuffle!.take(1)
         .map do |pic|
            blocks.push(Blocks::Block.new pic, win,
                  placement[:block_four][:x],
                     placement[:block_four][:y])
         end
         return Shape.new(blocks)
      end
   end
end
