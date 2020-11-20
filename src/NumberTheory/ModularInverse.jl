"""
    modular_inverse(base::Int64, modulus::Int64)

Compute the multiplicative inverse of the `base` under the `modulus`.


# Arguments
- `base::Int64`: base
- `modulus ::Int64`: modulus


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> ClassicAlgorithmsCollections.modular_inverse(3, 11)
4
```
"""
function modular_inverse(base::Int64, modulus::Int64)
    base = base % modulus
    for i in 1:modulus
        if (base * i) % modulus == 1
            return i
        end
    end
    return 1
end