# Let the initializer accept a nested structure of hashes.

class Tree
    attr_accessor :node_name, :children
    
    def initialize(node)
        @node_name = node.keys[0]
        @children = []
        node.values[0].collect {|k, v| @children.push Tree.new(k=>v)}
    end
    
    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block}
    end
    
    def visit(&block)
        block.call self
    end
end

# Test that the tree is correctly initialised and can be traversed.
ruby_tree = Tree.new( {
  'grandpa' => {
     'dad' => {
       'child 1' => {}, 
       'child 2' => {}
     },
     'uncle' => {
       'child 3' => {},
       'child 4' => {}
     }
  }
} )


puts "visiting entire tree"
ruby_tree.visit_all {|leaf| puts leaf.node_name}


