module ApplicationHelper
  class << self
    def parse_values(params)
      if params['origin'].present? && params['destination'].present?
        params['origin'].downcase!
        params['destination'].downcase!
      end
      params
    end

    def parse_edges(distances)
      distances.map { |entry| [entry.origin, entry.destination, entry.kilometers] }
    end
  end
end
