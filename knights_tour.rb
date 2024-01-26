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
end