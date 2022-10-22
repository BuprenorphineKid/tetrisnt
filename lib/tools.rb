require "gosu"

module Blocks

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

			def load_logo
				path4 = Dir[File.join(File.dirname(__FILE__), "../media/pic", "**", "logo*")].to_s.delete_suffix('"]').delete_prefix('["')
				@logo = Gosu::Image.new(path4.to_s)

				return @logo
			end

			def min(n1, n2)
				return n1 if n1 <= n2
				return n2 if n2 < n1
			end

			def max(n1, n2)
				return n1 if n1 >= n2
				return n2 if n1 < n2
			end

			def range_intersect?(min1, max1, min2, max2)
				return min(min1, max1) <= max(min2, max2) &&
						max(min1, max1) >= min(min2, max2)
			end
		end
	end
end

