class Integer

	def in_range? min=0, max=0, array=Array.new
		if array.empty?
  		return self >= Tools.min(min, max) && self <= Tools.max(min, max)
    else
  		return self >= Tools.min(array[0], array[1]) && self <= Tools.max(array[0], array[1])
    end
	end
end
