class Integer

	def in_range? min, max
		return self >= Tools.min(min, max) && self <= Tools.max(min, max)
	end
end
