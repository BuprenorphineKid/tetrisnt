class GameOver

  def initialize(dir)
    @dir = dir
    @dir.kill_all
  end
end
