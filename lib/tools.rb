require "gosu"

module Tools

	class << self
			attr_accessor :image

		def load_obj(color, obj)
			path = Dir[File.join(File.dirname(__FILE__), "../media/pic", "**", "#{color}_#{obj}*")].to_s.delete_suffix('"]').delete_prefix('["')
			@block = Gosu::Image.new(path.to_s)

			return @block
		end

		def load_back(num)
			path2 = Dir[File.join(File.dirname(__FILE__), "../media/pic", "**", "back*#{num}*")].to_s.delete_suffix('"]').delete_prefix('["')
			@back = Gosu::Image.new(path2.to_s)

			return @back
		end

		def load_tray(num)
			path3 = Dir[File.join(File.dirname(__FILE__), "../media/pic", "**", "tray*#{num}*")].to_s.delete_suffix('"]').delete_prefix('["')
			@tray = Gosu::Image.new(path3.to_s)

			return @tray
		end	
	end
end

