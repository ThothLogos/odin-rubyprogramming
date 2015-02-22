# The Odin Project - Section 3: Ruby Programming
# Computer Science: Data Structures & Algorithms, No. 1 Searching Binary Trees


class Node

  def initialize(key, parent = nil)
    @key = key
    @parent = parent # if nil, it must be a tree root
    @left_child = nil
    @right_child = nil
  end

  def left_child() @left_child end
  def set_left_child(arr) @left_child = arr[arr.length/2] end
  def unsorted_left_child(node_id) @left_child = node_id end

  def right_child() @right_child end
  def set_right_child(arr) @right_child = arr[arr.length/2] end
  def unsorted_right_child(node_id) @right_child = node_id end  

  def key() @key end
  def set_key(key) @key = key end
  
  def parent() @parent end
  def set_parent(parent) @parent = parent end
  
end
