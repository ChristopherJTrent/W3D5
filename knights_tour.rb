require_relative 'tree_node'
class KnightPathFinder
    @@MOVEMENT_VECTORS = [[2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]]

    def self.valid_moves(position)
        result = []
        @@MOVEMENT_VECTORS.each do |offset|
            dx, dy = offset
            curr_x, curr_y = position
            new_pos = [dx + curr_x, dy + curr_y]
            result << new_pos if new_pos.none? {|value| value > 8 || value < 0}
        end
        result
    end

    def initialize(position)
        @considered_positions = [position]
        @root_node = PolyTreeNode.new(position)
        build_move_tree
    end
    def new_move_positions(pos)
        new_moves = KnightPathFinder.valid_moves(pos)
            .reject{|move| @considered_positions.include?(move)}
        @considered_positions += new_moves
        new_moves
    end
    def build_move_tree
        queue = []
        queue.push(@root_node)
        until queue.empty?
            current_node = queue.shift
            current = new_move_positions(current_node.value).map {|v| PolyTreeNode.new(v)}
            current.each {|pos| current_node.add_child(pos)}
            queue.push(*current)
        end
    end
    def find_path(pos)
        found = @root_node.bfs(pos)
        path = [found.value]
        while found.parent
            found = found.parent
            path << found.value
        end
        path.reverse
    end
end