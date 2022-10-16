module Collision

	class << self

		def point_in_rect(x, y, rect)
			return x.in_range(rect.left, rect.right) &&
					 y.in_range(rect.top, rect.bottom)
		end
		
		
		def set(obj1, obj2, obj_side1, obj_side2)
			obj1.collide! obj_side1
			  obj2.collide! obj_side2
		end		
	end
end
