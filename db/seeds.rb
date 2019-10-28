require './config/route'

entries = [{ origin: 'a', destination: 'b', kilometers: 10 },
            { origin: 'a', destination: 'c', kilometers: 5 },
            { origin: 'b', destination: 'c', kilometers: 3 },
            { origin: 'b', destination: 'd', kilometers: 1 },
            { origin: 'c', destination: 'd', kilometers: 8 },
            { origin: 'c', destination: 'e', kilometers: 2 },
            { origin: 'd', destination: 'e', kilometers: 4 },
            { origin: 'd', destination: 'f', kilometers: 4 },
            { origin: 'e', destination: 'f', kilometers: 6 }]

entries.each { |entry| Distance.create(entry) }
