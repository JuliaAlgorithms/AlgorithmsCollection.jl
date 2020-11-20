"""
    minumum_operations(str_1::String, str_2::String)

The minimum operations algorithm explores how many string edits (`insert`, `remove`,
`replace`) are needed to convert str_1 to str_2.


# Arguments
- `str_1::String`: String 1 of length `m`
- `str_2::String`: String 2 of length `n`

# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> str1 = "sunday"
julia> str2 = "saturday"
julia> ClassicAlgorithmsCollections.minumum_operations(str1,str2)
3
```
"""
function minumum_operations(str_1::String, str_2::String)
    m = length(str_1)
    n = length(str_2)
    if m == 1
        return n
    end
    if n == 1
        return m
    end

    if str_1[m] == str_2[n]
        return minumum_operations(str_1[1:m-1], str_2[1:n-1])
    end

    insert = minumum_operations(str_1[1:m], str_2[1:n-1])
    remove = minumum_operations(str_1[1:m-1], str_2[1:n])
    replace = minumum_operations(str_1[1:m-1], str_2[1:n-1])

    if insert < remove < replace || insert < replace < remove
        return insert
    elseif remove < insert < replace || remove < replace < insert
        return remove
    end
    return replace
end
