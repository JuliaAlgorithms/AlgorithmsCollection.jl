"""
    find_word(
        graph::Dict{Int64,Array{String,1}},
        visited::Array{Bool,2},
        i::Int64,
        j::Int64,
        size_v::Int64,
        size_h::Int64,
        current_word::String,
        reference_words::Array{String,1},
        result::Array{String,1},
    )

Based on the Depth First Traversal algorithm, words will be find for a current char by
going through the graph up and down and keep track of the visited nodes. Important is that
the travelling happens in both direction up and down and left and right. Everythign will be
stacked in the visited list. If no word will be found the `current_word` has to be deleted.


# Arguments
- `graph::Dict{Int64,Array{String,1}}`: Graph of the connected nodes of chars, which can build the words
- `visited::Array{Bool,2}`: List of the visited chars in the graph
- `i::Int64`: current row
- `j::Int64`: current col
- `size_v::Int64`: total size of rows
- `size_h::Int64`: total size of cols
- `current_word::String`: current joint word of chars
- `reference_words::Array{String,1}`: Reference words to search for
- `result::Array{String,1}`: List of the found words in the graph
"""
function find_word(
    graph::Dict{Int64,Array{String,1}},
    visited::Array{Bool,2},
    i::Int64,
    j::Int64,
    size_v::Int64,
    size_h::Int64,
    current_word::String,
    reference_words::Array{String,1},
    result::Array{String,1},
)
    # Mark current vertex (CHAR) as visited
    visited[i, j] = true

    # Add visit vertex to current_word, which will be set to empty string by every new call
    current_word *= graph[i][j]

    #  If current_word is present in reference_words, then return it and stop
    if current_word in reference_words && !(current_word in result)
        push!(result, String(current_word))
    else
        # Traverse adjacent cells of graph
        for k in 1:i+1
            if k <= size_v
                for l in 1:j+1
                    if l <= size_h
                        if !visited[k, l]
                            find_word(
                                graph,
                                visited,
                                k,
                                l,
                                size_v,
                                size_h,
                                current_word,
                                reference_words,
                                result,
                            )
                        end
                    end
                end
            end
        end


        # Erase current character from string
        current_word = chop(current_word, tail = length(current_word) - 1)
        # Mark current vertex (CHAR) as not visited anymore
        visited[i, j] = false

    end
    return result


end

"""
    boogle_word_check(
        graph::Dict{Int64,Array{String,1}},
        reference_words::Array{String,1},
    )

For finding words (`reference_words`) in a field of chars, the boogle word check algorithm
goes for every single char up and down to see if the sum of the chars build a word
contained in th refernce word list. For this porpose the  Depth First Traversal algorithm
in function find_word is used.


# Arguments
- `graph::Dict{Int64,Array{String,1}}`: Graph of the connected nodes of chars, which can build the words
- `reference_words::Array{String,1}`: Reference words to search for

# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> word_list = ["GEEKS", "FOR", "QUIZ", "GO"]
julia> graph_boogle = Dict(
        1 => ["G", "I", "Z"],
        2 => ["U", "E", "K"],
        3 => ["Q", "S", "E"],
        4 => ["D", "O", "P"],
        5 => ["F", "O", "R"],
        )
julia> ClassicAlgorithmsCollections.boogle_word_check(graph_boogle, word_list)
["GEEKS", "QUIZ", "FOR"]
```
"""
function boogle_word_check(
    graph::Dict{Int64,Array{String,1}},
    reference_words::Array{String,1},
)

    size_v = length(keys(graph))
    size_h = length(collect(values(graph))[1])
    #Create an array of visited nodes
    visited = zeros(Bool, (size_v, size_h))

    # Create a array list for the results
    result = String[]

    init_str = string()
    for i in 1:size_v
        for j in 1:size_h
            result = find_word(
                graph,
                visited,
                i,
                j,
                size_v,
                size_h,
                init_str,
                reference_words,
                result,
            )

        end
    end
    return result
end
