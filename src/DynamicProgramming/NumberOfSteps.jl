"""
    number_of_steps(distance::Int64, step_size::Int64)

Number of step_size is calculating the total number of combinations for walking a `distance`
for a given number of step_size. For example, for a `distance` of 3 with a maximum
`step_size` of 3 will provide for possible combinations:

    - 1 step + 1 step + 1 step
    - 1 step + 2 step
    - 2 step + 1 step
    - 3 step

# Arguments
- `distance::Int64`: Distance to go
- `step_size::Int64`: Maximum step size of walking a distance


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> ClassicAlgorithmsCollections.number_of_steps(8,3)
81
```
"""
function number_of_steps(distance::Int64, step_size::Int64)

    if distance < 0
        return 0
    end
    if distance == 0
        return 1
    end
    result = 0
    for i in 1:step_size
        result += number_of_steps(distance - i, step_size)
    end
    return result
end
