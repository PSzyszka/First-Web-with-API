module Unamo
  class Keyword < Base
    attr_accessor :name,
                  :groups,
                  :positions,
                  :best_position,
                  :best_position_date,
                  :worst_position,
                  :worst_position_date,
                  :average_of_positions

    def initialize(hash)
      super(hash)
      sorted_positions = positions.sort_by { |key, value| [value, key] }
      @best_position_date = sorted_positions.first.try(:[], 0)
      @best_position = sorted_positions.first.try(:[], 1)
      @worst_position_date = sorted_positions.last.try(:[], 0)
      @worst_position = sorted_positions.last.try(:[], 1)
      @average_of_positions = average_value_of_position(positions)
    end

    def average_value_of_position(keyword_positions)
      if keyword_positions != {}
        position_values = keyword_positions.values
        average = position_values.inject{ |sum, el| sum + el }.to_f / position_values.size
        average.round(2)
      end
    end
  end
end
