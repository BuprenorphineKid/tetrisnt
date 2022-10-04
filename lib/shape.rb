class Shape < Blocks::Block

	attr_accessor :blocks

	def initialize(blocks, shape)
		@blocks = blocks
		@shape = shape
		
		@state = "falling"
	end	

	def fall
	 @state = "falling"
	 @blocks.each {|blk| blk.fall}
	end

	def idle 
	 @state = "idle"
	 @blocks.each {|b| b.idle}
	end

	def idle?
	 @state =~ /idle/
	end

	def reset_speed
		@blocks.each {|b| b.speed = 1}
	end

	def update
		@blocks.each do |block|
			block.update
		end
		if @blocks[0].on_floor?
			idle
		end
	end

	def draw
		@blocks.each do |block|
			block.draw
		end
	end
end
