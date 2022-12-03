module Blocks

  class LevelEventHandler
  
  		Shapes = {L: "L", PLUS: "plus",STRAIGHT: "straight",
    		          SQUARE: "square", J: "J", BAR: "bar", DOT: "dot"}
  						 
  	attr_accessor :current
  	attr_reader :tray, :col_hndlr, :active, :goal_hndlr

  	def initialize(win, tray)
                @win = win
                @tray = tray
                @col_hndlr = CollisionHandler.new(self)
                @goal_hndlr = GoalHandler.new(self)

                Blocks::Set.the_spawns tray
                @current = Blocks::Set.generate(win, Shapes[:STRAIGHT])

  		@active = []
  		@current.blocks.each {|blk| @active.push blk}
  	end

  	def produce_shape
  	        @current.blocks.each {|obj| @active.push obj} 
  		@current = Blocks::Set.generate(@win, Shapes[:STRAIGHT])
  	end

  	def update
  	  @tray.update
  		@current.update
  		@col_hndlr.update

  		if @current.idle?
  			produce_shape
  		end

  		@active.each {|obj| obj.update}

  		@current.blocks.each do |w|
  			if w.idle?
  				@active.push @current.blocks.shift
  			end
  		end
  	end

  	def draw
  		@current.draw
  		@tray.draw
  		@col_hndlr.draw
  		
    	@active.each {|obj| obj.draw}
  	end
  end
end
