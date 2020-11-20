"""
    initialize_matrices(graph::Dict{Int64,Array{Tuple{Int64,Int64},1}})

Initialize the matrices for distances and pathes.


# Arguments
- `graph::Dict{Int64,Array{Tuple{Int64,Int64},1}}`: Graph of the connected nodes with weights
"""
function initialize_matrices(graph::Dict{Int64,Array{Tuple{Int64,Int64},1}})
    # Define intial infinity weight & next matrix for given data type
    vertex_size = find_global_maximum_complex(graph)
    dist = fill(99999, (vertex_size, vertex_size))
    next = zeros(Int64, (vertex_size, vertex_size))

    # Updating the matrix with actual vertex values
    for (key, elements) in graph
        # Setting the diagonal-elements of the weight matrix to 0
        dist[key, key] = 0
        # Setting the diagonal-elements of the next matrix to vertex
        next[key, key] = key
        # Weigthing of the edges and pathes
        for value in elements
            dist[key, value[1]] = value[2]
            next[key, value[1]] = value[1]
        end
    end
    return dist, next, vertex_size
end


"""
    path_reconstruction(next::Array{Int64,2}, u::Int64, v::Int64)

Reconstruction of the actual path between any two endpoint vertices (u & v).


# Arguments
- `graph::Dict{Int64,Array{Tuple{Int64,Int64},1}}`: Graph of the connected nodes with weights
- `u::Int64`: Startpoint of the to investigated path
- `v::Int64`: Endpoint of the to investigated path
"""
function path_reconstruction(next::Array{Int64,2}, u::Int64, v::Int64)
    # Check if path exists
    if next[u, v] == 0
        return zeros(Int64, false)
    end

    # Initialize path
    path = [u]

    while u != v
        u = next[u, v]
        append!(path, u)
    end
    return path
end


"""
    shortest_path_tree(graph::Dict{Int64,Array{Tuple{Int64,Int64},1}}, u=nothing, v=nothing)

The Shortest Path Tree (SPT) algorithm solves the shortest path problem between every
pair of vertices in a given edge-weighted directed Graph based on the Floyd–Warshall
algorithm. Optional, the SPT also provides the total parts between a start- (u) and end-
point (v). For more information see: [https://en.wikipedia.org/wiki/Floyd–Warshall_algorithm](https://en.wikipedia.org/wiki/Floyd–Warshall_algorithm)


# Arguments
- `next::Array{Int64,2}`: Vertex matrix of the connected nodes
- `u::Int64`: Startpoint of the to investigated path; optional
- `v::Int64`: Endpoint of the to investigated path; optional


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> graph = Dict( 1 => [(3, -2)], 2 => [(1, 4),(3, 3)], 3 => [(4, 2)], 4 => [(2, -1)]
julia> ClassicAlgorithmsCollections.shortest_path_tree(graph, 2, 4)
([0 -1 -2 0; 4 0 2 4; 5 1 0 2; 3 -1 1 0], [2, 1, 3, 4])
```
"""
function shortest_path_tree(
    graph::Dict{Int64,Array{Tuple{Int64,Int64},1}},
    u = nothing,
    v = nothing,
)

    dist, next, vertex_size = initialize_matrices(graph)

    # Floyd–Warshall-Algorithm
    for k in 1:vertex_size
        for i in 1:vertex_size
            for j in 1:vertex_size
                # Checking for minimum
                if dist[i, j] > dist[i, k] + dist[k, j]
                    # Add new distance
                    dist[i, j] = dist[i, k] + dist[k, j]
                    # Add new path points
                    next[i, j] = next[i, k]
                end
            end
        end
    end

    # Path-Reconstruction
    if !(isnothing(u) && isnothing(v))
        return dist, path_reconstruction(next, u, v)
    else
        return dist
    end
end
