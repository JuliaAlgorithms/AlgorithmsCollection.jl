"""
    closest_pair_search(array::Array{Int64,1}, target::Int64)

Finding the closet pair of values for a given target in a sorted array. For this reason,
the distance between a pair of of values has to be minimazied with respect to the target.
For more information see: [https://en.wikipedia.org/wiki/Closest_pair_of_points_problem](https://en.wikipedia.org/wiki/Closest_pair_of_points_problem)


# Arguments
- `array::Array{Int64,1}`: Sorted array of integers
- `target::Int64`: Target-value to find the position


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [10, 22, 28, 29, 30, 40]
julia> target = 56
julia> ClassicAlgorithmsCollections.closest_pair_search(arr, target)
(28, 29)
```
"""
function closest_pair_search(array::Array{Int64,1}, target::Int64)

    # To store indexes of result pair
    res_left, res_right = 1, 1

    #Initialize left, right array boundaries, and their difference
    left, right, diff = 1, length(array), 999999

    # While there are elements between left and right array boundaries
    while right > left

        # Check if the distance between the current pair is closer than the closest
        # previous pair so far
        if abs(array[left] + array[right] - target) < diff
            res_left = left
            res_right = right
            # If yes update the distance
            diff = abs(array[left] + array[right] - target)
        end

        # If this pair has more sum than the target, shrink the array to a smaller value
        if array[left] + array[right] > target

            right -= 1
        # Otherwise, shrink the array to a larger value
        else
            left += 1
        end
    end
    return array[res_left], array[res_right]
end
