class Triangle
  # write code here


  attr_accessor :right, :left, :base

  def initialize(right, left, base)
    @right = right
    @left = left
    @base = base
  end

  class TriangleError < StandardError
  end
  
  def kind
    validate_triangle
    if right == left && left == base
      :equilateral
    elsif right == left || left == base || right == base
      :isosceles
    else
      :scalene
    end
  end

  def sides_greater_than_zero?
    [right, left, base].all?(&:positive?)
  end

  def valid_triangle_inequality?
    right + left > base && right + base > left && left + base > right
  end

  def validate_triangle
    raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
  end


end
