class Level

  attr_reader :assets

  def initialize director
    @director = director    

    @assets = {
      back: Background.new(director.win),
      tray: Tray.new(director.win),
      logo: Logo.new(director.win)  
      }
  
    @lines = Array.new
    15.times do |i|
      @lines.push Line.new i, Blocks::Set.the_spawns(@assets[:tray])
    end

    @assets[:obj_mgr] = Obj_Manager.new(director.win, @assets[:tray], @lines)
  end

  def pause_game
    @director.make "PAUSE"
  end

 
 def button_down id
    case id
    when Gosu::KB_ESCAPE
      @director.kill_all
    when Gosu::KB_LEFT
      @assets[:obj_mgr].current.move_left
    when Gosu::KB_RIGHT
      @assets[:obj_mgr].current.move_right
    when Gosu::KB_DOWN
      @assets[:obj_mgr].drop
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
