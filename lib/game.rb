class Game

	attr_accessor :win

	def self.load win: Win.new
		@win = win
	end

	def self.play
		@win.show
	end
end	
