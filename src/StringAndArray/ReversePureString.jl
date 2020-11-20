"""
    reverse_pure_string(text::String)

Reverse only the non-special characters (alphabet: 'a', to 'z' and 'A' to 'Z') and letting
the rest untouched. For this purpose, `reverse_pure_string` is scanning through the string
as an array, and if the current character is not special, it will reverse the elements by
swapping; vice versa, if the current character is a special element, the boundaries will be
modified.


# Arguments
- `text::String`: String with special character like !,<#


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> string = "a!!!b.c79.d,e'f,ghi3###""
julia> ClassicAlgorithmsCollectionsreverse_pure_string(string)
"a!!!b.c79.d,e'f,ghi3###""
```
"""
function reverse_pure_string(text::String)
    low = 1
    high = sizeof(text)

    text_array = collect(text)
    while low < high
        # Check if lower char is special character and change the boundary
        if !isletter(text_array[low])
            low += 1
            # Check if higher char is special character and change the boundary
        elseif !isletter(text_array[high])
            high -= 1
        else
            # Reverse the string by swapping
            text_array[low], text_array[high] = text_array[high], text_array[low]
            low += 1
            high -= 1

        end
    end
    return join(text_array)
end
