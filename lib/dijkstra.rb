class Dijkstra
	attr_accessor :graph, :origin, :destination, :edges, :verticies

	def initialize(origin, destination, edges)
		self.graph = []
		self.edges = edges
		self.verticies = unique_verticies
		populate_graph(origin, destination)
	end

	def populate_graph(origin, destination)
		self.origin = origin
		self.destination = destination
		self.graph = self.verticies.map do |vertex|
			node = { vertex: vertex, closed: false, predecessor: nil, distance: Float::INFINITY, neighbors: [] }
			node[:distance] = 0 if vertex == origin
			node
		end
		populate_neighbors
		recursive_dijkstra
	end

	def shortest_distance
		self.graph.detect { |node| node[:vertex] == self.destination }[:distance]
	end

	def shortest_path
		path = [self.destination]
		predecessor = self.destination
		while !predecessor.nil?
			predecessor = self.graph.detect { |node| node[:vertex] == predecessor }[:predecessor]
			path.unshift(predecessor) unless predecessor.nil?
		end
		path
	end

	private

	def unique_verticies
		self.edges.flatten.uniq.select { |edge| edge.class == String }
	end

	def populate_neighbors
	  self.verticies.each do |vertex|
	    self.edges.each do |edge|
	      if edge.include?(vertex)
	        self.graph.detect { |node| node[:vertex] == vertex }[:neighbors] << edge.detect { |neighbor| neighbor != vertex && neighbor.class == String }
	      end
	    end
	  end
	end

	def recursive_dijkstra
		open_verticies = self.graph.select { |node| node[:closed] == false }.sort_by { |node| node[:distance] }
		return if open_verticies.count == 0
		node = open_verticies.first
		node[:closed] = true
		node[:neighbors].each do |neighbor|
			neighbor_vertex = self.graph.detect { |node| node[:vertex] == neighbor && node[:closed] == false }
			next if neighbor_vertex.nil?
			self.edges.each do |edge|
				if edge.include?(node[:vertex]) && edge.include?(neighbor_vertex[:vertex])
					matcher_distance = node[:distance] + edge[2]
					if matcher_distance < neighbor_vertex[:distance]
						neighbor_vertex[:distance] = matcher_distance
						neighbor_vertex[:predecessor] = node[:vertex]
					end
				end
			end
		end
		recursive_dijkstra
	end
end
