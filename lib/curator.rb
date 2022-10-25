class Curator

  def initialize
    @y_sort, @x_sort = Array.new
  end

  def sift(blocks)
    comparison = -> (array, val) do
                    return array.sort_by { |x| x.val }
                  end

    @y_sort.push comparison.call blocks, "y" 
    @x_sort.push comparison.call blocks, "x"

    return {x: @x_sort, y: @y_sort}
  end
end
