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
    end
    def new_move_positions(pos)
        new_moves = KnightPathFinder.valid_moves(pos)
            .reject{|move| @considered_positions.include?(move)}
        @considered_positions += new_moves
        new_moves
    end
end