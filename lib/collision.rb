module Collision

	class << self

		def point_in_rect?(x, y, rect)
			return x.in_range(rect.x, rect.x + rect.width) &&
					 y.in_range(rect.y, rect.y + rect.height)
		end

		def point_in_circle?(x1, y1, x2, y2, radius)
			return Gosu.distance(x1, y1, x2, y2) < radius
		end
			
		def circle_in_circle?(x1,y1, x2, y2, radius1, radius2)
			return Gosu.distance(x1, y1, x2, y2) < radius1 + radius2
		end	

		def rect_in_rect?(r1, r2)
			return Blocks::Tools.range_intersect?(r1.x, r1.x + r1.width, r2.x, r2.x + r2.width) &&
					Blocks::Tools.range_intersect?(r1.y, r1.y + r1.height, r2.y, r2.y + r2.height)
		end	

		def will_collide?(r1, r2)
			return Blocks::Tools.range_intersect?(r1.x, r1.x + r1.width, r2.x, r2.x + r2.width) &&
					Blocks::Tools.range_intersect?(r1.next_y, r1.next_y + r1.height, r2.y, r2.y + r2.height)
		end
	end
end
