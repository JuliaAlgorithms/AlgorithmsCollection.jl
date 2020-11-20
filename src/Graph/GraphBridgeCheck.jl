"""
    find_global_maximum_graph(graph::Dict{Int64,Array{Int64,1}})

Find the total global maximum based on a comparsion between the intial vertex
(`global_maximum = 0`), the current dictionary key, and the accesible vertexes from
the array-list (value).


# Arguments
- `graph::Dict{Int64,Array{Int64,1}}`: Graph of the connected nodes
"""
function find_global_maximum_graph(graph::Dict{Int64,Array{Int64,1}})
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
bridge_check(
    graph::Dict{Int64,Array{Int64,1}},
    u::Int64,
    result::Array{Int64,1},
    visited::Array{Bool,1},
    parent::Array{Int64,1},
    low::Array{Int64,1},
    disc::Array{Int64,1},
    time::Int64,
)

For finding a bridge belonging to the current vertex, the algorithm has to remove firstly
one by one all edges. Next, the algorithm has to see if the removal of an edge causes a
disconnected graph. If yes, for the current pair of `u` and `v`, are a bridge between the
endpoints is found.


# Arguments
- `graph::Dict{Int64,Array{Tuple{Int64,Int64},1}}`: Graph of the connected nodes
- `u::Int64`: Next to visit vertex
- `result::Array{Int64,1}`: Results of the graph bridges; start and endpoint of the bridge
- `visited::Array{Bool,1}`: Visited vertex
- `parent::Array{Int64,1}`: Parent vertices in DFS tree'
- `low::Array{Int64,1}`: Lowest vertex reachable from subtree
- `disc::Array{Int64,1}`: Discovery time of the visited vertex
- `time::Int64`: Current time
"""
function bridge_check(
    graph::Dict{Int64,Array{Int64,1}},
    u::Int64,
    result::Array{Int64,1},
    visited::Array{Bool,1},
    parent::Array{Int64,1},
    low::Array{Int64,1},
    disc::Array{Int64,1},
    time::Int64,
)

    # Mark the current node as visited and print it
    visited[u] = true

    # Initialize discovery time
    disc[u] = time

    # Initialize low value
    low[u] = time

    # Update time
    time += 1


    #Recur for all the vertices adjacent to this vertex
    for v in graph[u]
        # If v is not visited yet, then make it a child of u
        # in DFS tree and recur for it
        if visited[v] == false
            parent[v] = u
            time, _ = bridge_check(graph, v, result, visited, parent, low, disc, time)

            # Check if the subtree rooted with v has a connection to
            # one of the ancestors of u
            low[u] = min(low[u], low[v])


            # If the lowest vertex reachable from subtree under v is below u in DFS tree,
            # then u-v is a bridge
            if low[v] > disc[u]
                # This returns goes up to the recursive function
                append!(result, (u, v))
            end
        elseif v != parent[u] # Update low value of u for parent function calls.
            low[u] = min(low[u], disc[v])
        end
    end
    return time, result
end


"""
    graph_bridge_check(graph::Dict{Int64,Array{Int64,1}}))

For finding a bridge or more bridges in an undirect connected graph, the kind of connection
has to be found, which can disconnect the graph by removing it. In case of disconnected
undirected graphs, the bridge is the connection which increases number of disconnected
components by removing it.


# Arguments
- `graph::Dict{Int64,Array{Tuple{Int64,Int64},1}}`: Graph of the connected nodes


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> graph_bridge = Dict(1 => [2, 3, 4], 2 => [1, 3], 3 => [1, 2], 4 => [1, 5], 5 => [4])
julia> ClassicAlgorithmsCollections.graph_bridge_check(graph_bridge)
[4 5; 1 4]
```
"""
function graph_bridge_check(graph::Dict{Int64,Array{Int64,1}})

    # Mark all the vertices as not visited and Initialize parent and visited,
    # and ap(articulation point) arrays
    vertex_size = find_global_maximum_graph(graph)

    #Create an array of visited nodes
    visited = zeros(Bool, vertex_size)

    disc = fill(99999, vertex_size)

    low = fill(99999, vertex_size)

    #
    parent = fill(vertex_size, vertex_size)

    # Intialze the time
    time = 0
    # Create a array list for the results
    result = zeros(Int64, false)
    # Call the recursive helper function to find bridges
    # in DFS tree rooted with vertex 'i'
    for i in 1:vertex_size
        time, result = bridge_check(graph, i, result, visited, parent, low, disc, time)
    end

    return adjoint(reshape(result, (2, :)))
end
