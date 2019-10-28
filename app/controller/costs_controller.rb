class CostsController
  class << self
    def calculate_cost(params)
      if weight_is_valid?(params['weight'].to_i) && ApplicationHelper::parse_values(params)
        result = search_best_path(params)
        cost = (params['weight'].to_i) * (0.15) * (result[:kilometers])
        { cost: cost, shortest_path: result[:shortest_path].join(', '), http_status: 200 }
      else
        { message: 'Invalid params!', http_status: 400 }
      end
    rescue
      { message: 'The origin or destination value does not exist!', http_status: 406 }
    end

    def weight_is_valid?(weight)
      0 < weight && weight <= 50
    end

    def search_best_path(params)
      if $graph.nil?
        edges = ApplicationHelper::parse_edges(Distance.all)
        graph = Dijkstra.new(params['origin'], params['destination'], edges)
      else
        $graph.populate_graph(params['origin'], params['destination'])
      end
      shortest_path = graph.shortest_path
      kilometers = graph.shortest_distance
      { shortest_path: shortest_path, kilometers: kilometers }
    end
  end
end
