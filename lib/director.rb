module Blocks

  class Director

    attr_accessor :win

    def initialize win
      @win = win
      @scenes = Array.new
      @current_scene = Level.new self
    end

    def make(scene)
      self.send :determine, scene
    end

    def button_down id
      @current_scene.button_down id
    end

    def button_up id
      @current_scene.button_up id
    end

    def determine scene
      case scene
      when /[Ll][Ee][Vv][Ee][Ll]|.*\d/
        level
      when /[TtBb][IiEe][TtGg][LlIi][EeNn]/
        title
      when /[SsPp][TtAa][AaUu][RrSs][TtEe]|/
        pause
      when /[Gg][Aa][Mm][Ee][Oo][Vv][Ee][Rr]/
        game_over
      end
    end

    def queue scene
       @scenes.push scene if scene.kind_of? Level
    end

    def kill_all
      @win.close
    end

    def update
      @current_scene.update
    end

    def draw
      @current_scene.draw
    end

    private

    def level
      @current_scene = Level.new self
    end

    def title
      @current_scene = Title.new self
    end

    def pause
      @current_scene = Pause.new self
    end

    def game_over
      @current_scene = GameOver.new self
    end
  end
end
