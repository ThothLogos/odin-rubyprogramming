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
      puts "  LEAF\t\t\t Node: #{node.key}\t Parent: #{parent}"
      return
    end
    puts "NEW BRANCH NODE\t\t Node: #{node.key}\t Parent: #{parent}"
    left_arr = arr[0..(arr.length/2)-1]
    right_arr = arr[(arr.length/2)+1..-1]

    unless left_arr.empty?
      node.set_left_child(left_arr)
      puts "      update\t\t Node: #{node.key}\t LChild: #{node.left_child}"
      build_tree(left_arr, node.key)
    end
    unless right_arr.empty?
      node.set_right_child(right_arr)
      puts "      update\t\t Node: #{node.key}\t RChild: #{node.right_child}"
      build_tree(right_arr, node.key)
    end
    puts "Branch Complete\t\t Node: #{node.key}\t Parent: #{parent}\t Left: #{node.left_child}\t Right: #{node.right_child}"
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