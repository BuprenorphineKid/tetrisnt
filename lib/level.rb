module Blocks

  class Level

    attr_reader :assets

    def initialize director
      @director = director    

      @assets = {
        back: Background.new(director.win),
        logo: Logo.new(director.win),
        event_handler: LevelEventHandler.new(director.win, Tray.new(director.win))
      } 
    end

    def pause_game
      @director.make "Pause"
    end

    def game_over
      @diector.make "GameOver"
    end
      
   def button_down id
      case id
      when Gosu::KB_ESCAPE
        @director.kill_all
      when Gosu::KB_LEFT
        @assets[:event_handler].current.move_left
      when Gosu::KB_RIGHT
        @assets[:event_handler].current.move_right
      when Gosu::KB_DOWN
        @assets[:event_handler].col_hndlr.drop
      end
    end

    def button_up id
    end

    def update
      @assets.each_value {|ass| ass.update}

      if @assets[:event_handler].goal_hndlr.loss == true
        game_over
      end
    end 

    def draw
      @assets.each_value {|ass| ass.draw}    
    end
  end
end
