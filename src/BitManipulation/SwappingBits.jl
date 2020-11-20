"""
    swapping_even_odd_bits(n::Int64))

For a given integer value, all odd bits will be swapped with even bits.


# Arguments
- `n::Int64`: Integer value of the number, which has to be swapped.


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> ClassicAlgorithmsCollections.function swapping_even_odd_bits(23)
43
```


# Notes
---
The definition of the even and odd bits:
```julia-repl
even_bits = n & 0xAAAAAAAA
odd_bits = n & 0x55555555
```
"""
function swapping_even_odd_bits(n::Int64)
    # Defining even and odd bits
    even_bits = n & 0xAAAAAAAA
    odd_bits = n & 0x55555555

    # Shifting the even and odd bits
    even_bits >>= 1
    odd_bits <<= 1
    return (even_bits | odd_bits)
end
