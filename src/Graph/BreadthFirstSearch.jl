"""
    find_global_maximum_bfs(graph::Dict{Int64,Array{Int64,1}})

Find the total global maximum based on a comparsion between the intial vertex
(`global_maximum = 0`), the current dictionary key, and the accesible vertexes from
the array-list (value).


# Arguments
- `graph::Dict{Int64,Array{Int64,1}}`: Graph of the connected nodes
"""
function find_global_maximum_bfs(graph::Dict{Int64,Array{Int64,1}})
    global_maximum = 0
    # Going through the dictionary
    for (key, value) in graph
        # Check the keys as new global maximum
        if key > global_maximum
            global_maximum = key
        end

        # Check the values as new local maximum
        local_maximum = maximum(value)

        # Check if new local maximum becomes global maximum
        if local_maximum > global_maximum
            global_maximum = local_maximum
        end
    end
    return global_maximum
end

"""
    breadth_first_search(graph::Dict{Int64,Array{Int64,1}}, start::Int64)

The breadth-first search (BFS) is an algorithm dedicated to traversing or searching for
tree or graph data structures. It starts at a specified tree root (start) for exploring
all connected neighbor nodes. The important feature is that the BFS automatically leaves
the present depth and passes on to the next nodes at a deeper level. BFS is queue-based.
For more information see: [https://en.wikipedia.org/wiki/Breadth-first_search](https://en.wikipedia.org/wiki/Breadth-first_search)


# Arguments
- `graph::Dict{Int64,Array{Int64,1}}`: Graph of the connected nodes
- `start::Int64`: Startpoint (first selected vertex) of the graph-traveling process


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> graph = Dict(1=> [2, 3], 2=> [3], 3=> [1, 4], 4=> [4])
julia> ClassicAlgorithmsCollections.breadth_first_search(graph, 3)
[3, 1, 4, 2]
```
"""
function breadth_first_search(graph::Dict{Int64,Array{Int64,1}}, start::Int64)

    # Mark all the vertices as not visited
    n = find_global_maximum_bfs(graph)
    visited = zeros(Bool, n)

    # Create a queue for BFS
    queue = zeros(Int64, false)

    # Create array-list for the searching solution
    solution = zeros(Int64, false)

    # Mark the source node as visited and enqueue it
    visited[start] = true
    append!(queue, start)

    while !isempty(queue)

        # Dequeue a vertex from
        # queue and print it
        start = popat!(queue, 1)
        append!(solution, start)
        # Get all adjacent vertices of the dequeued vertex s. If a adjacent
        # has not been visited, then mark it visited and enqueue it
        for i in graph[start]
            # Check if vertex has already been visited
            if visited[i] == false
                append!(queue, i)
                visited[i] = true
            end
        end
    end
    return solution
end
