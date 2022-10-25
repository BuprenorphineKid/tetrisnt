require "gosu"

class Win < Gosu::Window

	attr_reader :tray

	def initialize 
		super width = 640, height = 1080

    @director = Director.new(self)
	end

	def button_down id
		@director.button_down id
	end

	def button_up id
		@director.button_up id
	end

 	def update
		@director.update
	end

	def draw
		@director.draw
	end
end
