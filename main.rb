require "gosu"
Dir[File.join(__dir__, "lib/", "**", "*.rb")].each do |file|
require file
end

Game.load
Game.play
