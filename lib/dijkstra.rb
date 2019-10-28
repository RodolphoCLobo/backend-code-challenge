class Dijkstra
	attr_accessor :graph, :origin, :destination, :edges, :verticies

	def unique_verticies
		self.edges.flatten.uniq.select { |s| s.class == String }
	end

	def populate_graph
		self.graph = self.verticies.map do |vertex|
			node = { vertex: vertex, closed: false, predecessor: nil, distance: Float::INFINITY, neighbors: [] }
			node[:distance] = 0 if vertex == origin
			node
		end
	end

	def initialize(origin, destination, edges)
		self.graph = []
		self.origin = origin
		self.destination = destination
		self.edges = edges
		self.verticies = self.unique_verticies
		self.populate_graph
		self.verticies.each do |vertex|
			self.edges.each do |edge|
				if edge.include?(vertex)
					self.graph.detect { |s| s[:vertex] == vertex }[:neighbors] << edge.detect { |s| s != vertex && s.class == String }
				end
			end
		end
		self.recursive_dijkstra
	end

	def recursive_dijkstra
		open_verticies = self.graph.select { |s| s[:closed] == false }.sort_by { |node| node[:distance] }
		if open_verticies.count == 0
			return
		else
			node = open_verticies.first
			node[:closed] = true
			node[:neighbors].each do |neighbor|
				neighbor_vertex = self.graph.detect { |s| s[:vertex] == neighbor && s[:closed] == false }
				self.edges.each do |edge|
					next if neighbor_vertex.nil?
					if edge.include?(node[:vertex]) && edge.include?(neighbor_vertex[:vertex])
						matcher_distance = node[:distance] + edge[2]
						if matcher_distance < neighbor_vertex[:distance]
							neighbor_vertex[:distance] = matcher_distance
							neighbor_vertex[:predecessor] = node[:vertex]
						end
					end
				end
			end
		end
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
end
