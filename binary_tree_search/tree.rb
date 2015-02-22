# The Odin Project - Section 3: Ruby Programming
# Computer Science: Data Structures & Algorithms, No. 1 Searching Binary Trees

require_relative 'node.rb'

class Tree

  def initialize(numbers)
    @nodes = {}
    @starting_arr = numbers
    @root = numbers[numbers.length/2]
    build_tree(@starting_arr, nil)
  end

  def build_tree(arr, parent)

    midpoint = arr[arr.length/2]
    node = Node.new(midpoint, parent)
    @nodes[node.object_id] = node.key

    # Leaf case
    return if arr.length == 1

    # Split to prepare for recursion
    left_arr = arr[0..(arr.length/2)-1]
    right_arr = arr[(arr.length/2)+1..-1]

    unless left_arr.empty?
      node.set_left_child(left_arr)
      build_tree(left_arr, node.key)
    end

    unless right_arr.empty?
      node.set_right_child(right_arr)
      build_tree(right_arr, node.key)
    end

  end

  def view_tree
    @nodes.each do |node|
      print "Node: #{get_id(node[0]).key} Parent: #{get_id(node[0]).parent}"
      puts " LChild: #{get_id(node[0]).left_child} RChild: #{get_id(node[0]).right_child}"
    end
  end

  def get_id(node)
    return ObjectSpace._id2ref(node)
  end
end

small = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

minimum = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]

primes_small = [2, 3, 5, 7, 11, 13, 17, 19, 23, 31, 37, 41, 43, 47, 53]

primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 31, 37, 41, 43, 47, 53, 59,
           61, 67, 71, 79, 83, 89, 97]

tree = Tree.new(minimum)
tree.view_tree
