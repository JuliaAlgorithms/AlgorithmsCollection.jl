"""
    find_global_maximum_complex(graph::Dict{Int64,Array{Tuple{Int64,Int64},1}})

`find_global_maximum_complex` is similar to `find_global_maximum` instead is desigend
for handling graphs with weights.


# Arguments
- `graph::Dict{Int64,Array{Tuple{Int64,Int64},1}}`: Graph of the connected nodes with weights
"""
function find_global_maximum_complex(graph::Dict{Int64,Array{Tuple{Int64,Int64},1}})
    global_maximum = 0
    # Going through the dictionary
    for (key, value) in graph

        # Check the keys as new global maximum
        if key > global_maximum
            global_maximum = key
        end

        # Check the values as new local maximum
        for local_maximum in value

            # Check if new local maximum becomes global maximum
            if local_maximum[1] > global_maximum
                global_maximum = local_maximum[1]
            end

        end

    end
    return global_maximum
end


"""
    find_parent_in_spanning_tree(parent::Array{Int64,1}, i::Int64, ref_key::Int64)

The find parent algorithm is a recursive function to find the subeset of an item i for
graph test of having a spanning tree.

# Arguments
- `parent::Array{Int64,1}`: Array of the subset of the items
- `i::Int64`: Index of the parents-item
"""
function find_parent_in_spanning_tree(parent::Array{Int64,1}, i::Int64)
    if parent[i] == i
        return i
    end
    return find_parent_in_spanning_tree(parent, parent[i])
end


"""
Provided by: [https://discourse.julialang.org/t/sort-matrix-based-on-the-elements-of-a-specific-column/23475/5](https://discourse.julialang.org/t/sort-matrix-based-on-the-elements-of-a-specific-column/23475/5)
"""
function sortrows(M, by = zeros(0))
    if by == zeros(0)
        order = copy(M)
    else
        order = copy(by)
    end
    if size(order, 2) > 1
        order = Int64.(order .- minimum(order, dims = 1))
        order = (order ./ maximum(order, dims = 1)) * (10) .^ (size(order, 2):-1:1)
    end
    order = sortperm(order[:, 1])
    return M[order, :]
end


"""
    minimum_spanning_tree(graph::Dict{Int64,Array{Tuple{Int64,Int64},1}}))

The minimum spanning tree (MST) algorithm detects a subset of the edges of a connected,
edge-weighted undirected graph that connects all the vertices together. The MST algorithms
focus is a) to exclude any cycles and b) to find the minimum possible total edge weight,
which will create a spanning tree whose sum of edge weights is as small as possible.
The Kruskal's algorithm is used to find the minimum spanning forest of an undirected
edge-weighted graph.
For more information see: [https://en.wikipedia.org/wiki/Minimum_spanning_tree](https://en.wikipedia.org/wiki/Minimum_spanning_tree)
and [https://en.wikipedia.org/wiki/Kruskal%27s_algorithm](https://en.wikipedia.org/wiki/Kruskal%27s_algorithm)


# Arguments
- `graph::Dict{Int64,Array{Tuple{Int64,Int64},1}}`: Graph of the connected nodes with the weights


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> graph_with_spanning_tree = Dict(1 => [(2, 10), (3, 6), (4, 5)], 2 => [(4, 15)], 3 => [(4, 4)]
julia> ClassicAlgorithmsCollections.minimum_spanning_tree(graph_with_spanning_tree)
[3 4 4; 1 4 5; 1 2 10]
```
"""
function minimum_spanning_tree(graph::Dict{Int64,Array{Tuple{Int64,Int64},1}})
    # Get the total number of nodes
    vertex_size = find_global_maximum_complex(graph)

    # Intialize array list
    graph_array = zeros(Int64, false)

    # Append the dictionary to 1D array
    for (key, value) in graph
        for items in value
            append!(graph_array, [key, items[1], items[2]])
        end
    end

    # Retransform from 1D-array to 2D-array with three columns for node, connected node,
    # and weight.
    graph_array = adjoint(reshape(graph_array, (3, :)))
    # Because step on is sorting all the edges in non-decreasing order of their
    # weight, the dictionary has to be translated into an array to be able to be
    # sorted.
    graph_array = sortrows(graph_array, graph_array[:, [3]])

    # Create array-list for finding the parents and intialize all subsets to vertex_size
    # with an increasing range, because it has to be reordered by the ranking later.
    parent = collect(Int64, 1:vertex_size)

    # Create an array for ranking
    rank = zeros(Int64, vertex_size)

    # Create a array list for the results
    result = zeros(Int64, false)

    # Number of edges to be taken is equal to vertex_size
    i = 1 # An index variable, used for sorted edges
    e = 1 # An index variable, used for result[]
    while e < vertex_size
        # Step 2: Pick the smallest edge and increment the index for next iteration
        u, v, w = graph_array[i, :]
        i += 1
        x = find_parent_in_spanning_tree(parent, u)
        y = find_parent_in_spanning_tree(parent, v)

        # If including this edge does't cause cycle, include it in result and
        # increment the index of result for next edge
        if x != y
            e += 1
            append!(result, [u, v, w])
            #  union of two sets of x and y by ranking
            xroot = find_parent_in_spanning_tree(parent, x)
            yroot = find_parent_in_spanning_tree(parent, y)

            # Attach smaller rank tree under root of high rank tree (Union by Rank)
            if rank[xroot] < rank[yroot]
                parent[xroot] = yroot
            elseif rank[xroot] > rank[yroot]
                parent[yroot] = xroot

                # If ranks are same, then make one as root and increment its rank by one
            else
                parent[yroot] = xroot
                rank[xroot] += 1
            end
        end
        # Else discard the edge
    end
    # Reshape the 1D array to 3D array
    return adjoint(reshape(result, (3, :)))
end
