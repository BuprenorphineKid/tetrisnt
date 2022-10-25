class Level

  attr_reader :assets

  def initialize director

    @assets = {
      back: Background.new(director.win),
      tray: Tray.new(director.win),
      logo: Logo.new(director.win),
    }
    Blocks::Set.the_spawns(@assets[:tray])
    @assets[:obj_manager] = Obj_Manager.new(director.win)

    @director = director
    
  end

  def pause_game
    @director.make "PAUSE"
  end

 
 def button_down id
    case id
    when Gosu::KB_ESCAPE
      close
    when Gosu::KB_LEFT
      @obj_mgr.current.move_left
    when Gosu::KB_RIGHT
      @obj_mgr.current.move_right
    when Gosu::KB_DOWN
      @obj_mgr.current.land_on(@obj_mgr.active)
    end
  end

  def button_up id
  end

  def update
    @assets.each_value {|ass| ass.update}
  end

  def draw
    @assets.each_value {|ass| ass.draw}    
  end
end
