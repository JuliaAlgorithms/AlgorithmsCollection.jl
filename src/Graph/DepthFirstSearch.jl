"""
    find_global_maximum_dfs(graph::Dict{Int64,Array{Int64,1}})

Find the total global maximum based on a comparsion between the intial vertex
(`global_maximum = 0`), the current dictionary key, and the accesible vertexes from
the array-list (value).


# Arguments
- `graph::Dict{Int64,Array{Int64,1}}`: Graph of the connected nodes
"""
function find_global_maximum_dfs(graph::Dict{Int64,Array{Int64,1}})
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
    dfs_recrusive(
        graph::Dict{Int64,Array{Int64,1}},
        start::Int64,
        visited::Array{Bool,1},
        solution::Array{Int64,1},
    )

The recursively call of the dfs_recrusive is essential for exploring each single branch
of the graph.


# Arguments
- `graph::Dict{Int64,Array{Int64,1}}`: Graph of the connected nodes
- `start::Int64`: Startpoint (first selected vertex) of the graph-traveling process
- `visited::Array{Bool,1}`: Visited nodes of the graph
- `solution::Array{Int64,1}`: Solution of the raph-traveling proces
"""
function dfs_recrusive(
    graph::Dict{Int64,Array{Int64,1}},
    start::Int64,
    visited::Array{Bool,1},
    solution::Array{Int64,1},
)
    # Mark the current node as visited and enqueue it
    visited[start] = true
    append!(solution, start)

    # Recur for all the vertices adjacent to this vertex
    for i in graph[start]
        if visited[i] == false
            dfs_recrusive(graph, i, visited, solution)
        end
    end
    return solution

end


"""
    depth_first_search(graph::Dict{Int64,Array{Int64,1}}, start::Int64)

The depth-first search (DFS) is an algorithm dedicated to traversing or searching for
tree or graph data structures. It starts at a specified tree root (start) for exploring
as far as possible at each branch. Afterthat the BFS starts automatically backtracking.
DFS is stack-based.
For more information see: [https://en.wikipedia.org/wiki/Depth-first_search](https://en.wikipedia.org/wiki/Depth-first_search)


# Arguments
- `graph::Dict{Int64,Array{Int64,1}}`: Graph of the connected nodes
- `start::Int64`: Startpoint (first selected vertex) of the graph-traveling process


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> graph = Dict(1=> [2, 3], 2=> [3], 3=> [1, 4], 4=> [4])
julia> ClassicAlgorithmsCollections.depth_first_search(graph, 3)
[3, 1, 2, 4]
```
"""
function depth_first_search(graph::Dict{Int64,Array{Int64,1}}, start::Int64)

    # Mark all the vertices as not visited
    n = find_global_maximum_dfs(graph)
    visited = zeros(Bool, n)

    # Create array-list for the searching solution
    solution = zeros(Int64, false)

    result = dfs_recrusive(graph, start, visited, solution)
    return result
end
