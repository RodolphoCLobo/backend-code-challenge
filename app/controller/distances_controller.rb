class DistancesController
  class << self
    def create(params)
      params = ApplicationHelper::parse_values(params)
      distance = Distance.find_or_create_by(
        origin: params['origin'], destination: params['destination']
      )
      if distance.update(kilometers: params['kilometers'])
        $graph = Dijkstra.new(
          $graph.origin, $graph.distance,
          ApplicationHelper::parse_edges(Distance.all)
        ) unless $graph.nil?
        { message: 'Distance created or updated with success!', http_status: 200 }
      else
        { message: distance.errors.full_messages.first, http_status: 400 }
      end
    end
  end
end
