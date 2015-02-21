# The Odin Project - Section 3: Ruby Programming
# Computer Science: Data Structures & Algorithms, No. 1 Searching Binary Trees

require_relative 'node.rb'

class Tree

  def initialize(numbers)
    @starting_arr = numbers
    @root = numbers[numbers.length/2]
    build_tree(@starting_arr, nil)
  end

  def build_tree(arr, parent)
    
    midpoint = arr[arr.length/2]
    node = Node.new(midpoint, parent)
    if arr.length == 1
      print "_LEAF_ Node: #{node.key}, parent: #{parent}\n"
      return
    end

    print "BRANCH Node: #{node.key}, parent: #{parent}\n"

    left_arr = arr[0..(arr.length/2)-1]
    right_arr = arr[(arr.length/2)+1..-1]
    
    unless left_arr.empty?
      node.set_left_child(left_arr)
      print "update Node: #{node.key}, Left add: #{node.left_child}\n"
      build_tree(left_arr, node.key)
    end

    unless right_arr.empty?
      node.set_right_child(right_arr)
      print "update Node: #{node.key}, Right add: #{node.right_child}\n"
      build_tree(right_arr, node.key)
    end

    print "Branch Complete: #{node.key}, P: #{parent}, L: #{node.left_child}, R: #{node.right_child}\n"
  end


  def view_tree

  end

  def insert_node(node)
  end

  def remove_node(node)
  end

  def numbers() @numbers end
  def root() @root end

end


small = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 31, 37, 41,
         43, 47, 53, 59, 61, 67, 71, 79, 83, 89, 97]

primes_small = [2, 3, 5, 7, 11, 13, 17, 19, 23, 31, 37, 41, 43, 47, 53]

tree = Tree.new(primes_small)