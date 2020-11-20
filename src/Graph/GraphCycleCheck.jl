"""
    find_global_maximum(graph::Dict{Int64,Array{Int64,1}})

Find the total global maximum based on a comparsion between the intial vertex
(`global_maximum = 0`), the current dictionary key, and the accesible vertexes from
the array-list (value).


# Arguments
- `graph::Dict{Int64,Array{Int64,1}}`: Graph of the connected nodes
"""
function find_global_maximum(graph::Dict{Int64,Array{Int64,1}})
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
    find_parent_in_cycle(parent::Array{Int64,1}, i::Int64, ref_key::Int64)

The find parent algorithm is a recursive function to find the subeset of an item i for
graph test of being cycling.

# Arguments
- `parent::Array{Int64,1}`: Array of the subset of the items
- `i::Int64`: Index of the parents-item
- `ref_key::Int64`: Reference Key, which can be for example the total size of the subset
"""
function find_parent_in_cycle(parent::Array{Int64,1}, i::Int64, ref_key::Int64)
    if parent[i] == ref_key
        return i
    end
    return find_parent_in_cycle(parent, parent[i], ref_key)
end


"""
    graph_cycle_check(graph::Dict{Int64,Array{Int64,1}})

The disjoint-set data structure principle is used to check if a direct or undirect
graph contains a cycle. For this reason, the algorithm keeps the first track of a set
of items partitioned into several disjoint (non-overlapping) subsets to find which
subset a particular item is kept. This procedure is essential to figure out if two
items are in the same subgroup. Next, the two subsets have to be merged into a single
subset. For more information see: [https://en.wikipedia.org/wiki/Disjoint-set_data_structure](https://en.wikipedia.org/wiki/Disjoint-set_data_structure)


# Arguments
- `graph::Dict{Int64,Array{Int64,1}}`: Graph of the connected nodes


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> graph_cycle_true = Dict(1 => [2], 2 => [3], 3 => [1, 4])
julia> ClassicAlgorithmsCollections.graph_cycle_check(graph_cycle_true)
true
julia> graph_cycle_false = Dict(1 => [2], 2 => [5], 3 => [1, 4])
julia> ClassicAlgorithmsCollections.graph_cycle_check(graph_cycle_false)
false
```
"""
function graph_cycle_check(graph::Dict{Int64,Array{Int64,1}})
    # Get the maximum length of the vertex
    vertex_size = find_global_maximum(graph)

    # Create array-list for finding the parents and intialize all subsets to vertex_size, because
    # negative indixing is forbidden in Julia.
    parent = fill(vertex_size, vertex_size)

    # Iterate through all edges of graph for finding the subset of both vertices of every edge.
    # If the two subsets are equal, then graph has a cycle inside.
    for (i, values) in graph
        for j in values
            x = find_parent_in_cycle(parent, i, vertex_size)
            y = find_parent_in_cycle(parent, j, vertex_size)

            # Check if equal, then graph has a cycle
            if x == y
                return true
            end

            x_set = find_parent_in_cycle(parent, x, vertex_size)
            y_set = find_parent_in_cycle(parent, y, vertex_size)
            # Update the parent-set
            parent[x_set] = y_set
        end
    end
    return false

end
