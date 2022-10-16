module Collision

	class << self

		def detect(obj1, obj2)
			Collision.set(obj1, obj2, "bottom", "top")
			 #if (obj1.top_points[:left][:x], obj1.top_points[:left][:y],
			 #		obj1.top_points[:right][:x], obj1.top_points[:right][:y]) 
					

#			Collision.set(obj1, obj2, "top", "bottom") if obj1.top <= obj2.bottom
#			Collision.set(obj1, obj2, "left", "right") if obj1.left >= obj2.right
		end
		
		def set(obj1, obj2, obj_side1, obj_side2)
			obj1.collide! obj_side1
			  obj2.collide! obj_side2
		end		
	end
end
