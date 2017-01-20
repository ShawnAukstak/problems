require 'rspec/autorun'

class Tree
  def initialize(root)
    @root = root 
  end
  
  def breadth_first_search
    output = []
    queue = []
   
    temp = @root
    
    until temp.nil?
      output << temp.value
      
      if temp.left != nil
        queue << temp.left
      end
      
      if temp.right != nil
        queue << temp.right
      end
      
      temp = queue.shift
    end
    
    return output.join(' ')
  end
  
  def depth_first_search(order)
    output = []
 
    case order
      when :pre_order
        pre_order(@root, output)
      when :in_order
        in_order(@root, output)
      when :post_order
        post_order(@root, output)
    end 
    
    return output.join(' ')
  end
  
  private
  
  def pre_order(root, output)
    return if root.nil?
    
    output << root.value
    pre_order(root.left, output)  
    pre_order(root.right, output)
  end
  
  def in_order(root, output)
    return if root.nil?
    
    in_order(root.left, output)  
    output << root.value
    in_order(root.right, output)
  end
  
  def post_order(root, output)
    return if root.nil?
    
    post_order(root.left, output)  
    post_order(root.right, output)
    output << root.value
  end
end

class TreeNode
  attr_accessor :left, :right, :value
  
  def initialize(value)
   @value = value 
  end
  
  def to_s
    @value.to_s
  end
end

def get_tree
  root = TreeNode.new(100)

  root.left = TreeNode.new(50)
  root.left.left = TreeNode.new(25)
  root.left.right = TreeNode.new(75)

  root.right = TreeNode.new(150)
  root.right.left = TreeNode.new(125)
  root.right.right = TreeNode.new(175)

  return Tree.new(root)
end

RSpec.describe Tree do
  describe "#depth_first_search" do
    it "returns in depth first search order" do
      tree = get_tree

      expect(tree.depth_first_search(:pre_order)).to eq "100 50 25 75 150 125 175"
      expect(tree.depth_first_search(:in_order)).to eq "25 50 75 100 125 150 175"
      expect(tree.depth_first_search(:post_order)).to eq "25 75 50 125 175 150 100"
    end
  end
  
  describe "#breadth_first_search" do 
    it "returns breadth first search" do
      tree = get_tree
      
      expect(tree.breadth_first_search).to eq "100 50 150 25 75 125 175"
    end
  end
end