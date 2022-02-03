require 'pry'

class Triangle
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    validate_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || a == c || b == c
      :isosceles
    else
      :scalene
    end
  end

  def side_equality?
    a + b > c && a + c > b && b + c > a
  end

  def sides_greater_than_zero?
    [a, b, c].all?(&:positive?)
  end

  def validate_triangle
    raise TriangleError unless side_equality? && sides_greater_than_zero?
  end

  class TriangleError < StandardError
  end
end

# Triangle.new(0, 0, 0).kind
