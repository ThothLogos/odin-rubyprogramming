# The Odin Project - Section 3: Ruby Programming
# Computer Science: Data Structures & Algorithms, No. 1 Searching Binary Trees


class Node

  def initialize(value = nil, parent = nil, children = nil, tier = nil)
    @value = value
    @parent = parent
    @children = children
    @tier = tier
  end



  def value() @value end
  def set_value(value) @value = value end
  
  def parent() @parent end
  def set_parent(parent) @parent = parent end
  
  def children() @children end
  def set_children(children) @children = children end

  def tier() @tier end
  def set_tier(tier) @tier = tier end
end
