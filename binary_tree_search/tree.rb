# The Odin Project - Section 3: Ruby Programming
# Computer Science: Data Structures & Algorithms, No. 1 Searching Binary Trees

require_relative 'node.rb'

class Tree

  def initialize(numbers = nil, unsorted)
    @sorted_tree = {}
    @unsorted_tree = {}
    #@starting_arr = numbers
    #@root = numbers[numbers.length/2]
    #build_tree_sorted(@starting_arr, nil)
    build_tree_unsorted(unsorted, nil)
  end

  def build_tree_unsorted(arr, parent_id)

    node = Node.new(arr.shift, parent_id)
    @unsorted_tree[node.object_id] = node

    unless parent_id.nil?
      if @unsorted_tree[parent_id].left_child.nil? && node.key <= @unsorted_tree[parent_id].key
        @unsorted_tree[parent_id].unsorted_left_child(node.object_id)
      elsif @unsorted_tree[parent_id].right_child.nil? && node.key > @unsorted_tree[parent_id].key
        @unsorted_tree[parent_id].unsorted_right_child(node.object_id)
      end
    end

    return if arr.length < 1

    build_tree_unsorted(arr, node.object_id)

  end

  def build_tree_sorted(arr, parent)

    midpoint = arr[arr.length/2]
    node = Node.new(midpoint, parent)
    @sorted_tree[node.object_id] = node.key

    # Leaf case
    return if arr.length == 1

    # Split to prepare for recursion
    left_arr = arr[0..(arr.length/2)-1]
    right_arr = arr[(arr.length/2)+1..-1]

    unless left_arr.empty?
      node.set_left_child(left_arr)
      build_tree_sorted(left_arr, node.key)
    end

    unless right_arr.empty?
      node.set_right_child(right_arr)
      build_tree_sorted(right_arr, node.key)
    end

  end

  def view_tree(nodes)
    puts nodes
    nodes.each do |node|
      if get_obj(node[0]).parent.nil?
        print "Node: #{get_obj(node[0]).key}"
      else
        print "Node: #{get_obj(node[0]).key} Parent: #{nodes[get_obj(node[0]).parent].key}"
      end
      puts " LChild: #{get_obj(node[0]).left_child} RChild: #{get_obj(node[0]).right_child}"
    end
  end

  def get_obj(node_id)
    return ObjectSpace._id2ref(node_id)
  end

  def sorted_tree() @sorted_tree end
  def unsorted_tree() @unsorted_tree end
end

small = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

minimum = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]

primes_small = [2, 3, 5, 7, 11, 13, 17, 19, 23, 31, 37, 41, 43, 47, 53]

primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 31, 37, 41, 43, 47, 53, 59,
           61, 67, 71, 79, 83, 89, 97]

rando = [4, 7, 1, 5, 9, 2, 3, 6, 8, 10]

tree = Tree.new(nil, rando)
#tree.view_tree(tree.sorted_tree)
tree.view_tree(tree.unsorted_tree)
