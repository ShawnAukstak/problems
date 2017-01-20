class BinaryTreeNode
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
  end

  def to_s
    "{#{value}::#{left}|#{right}}"
  end
end