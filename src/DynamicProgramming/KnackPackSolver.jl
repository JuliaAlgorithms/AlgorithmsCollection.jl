
"""
    knapsack_solver(array::Array{Int64,1}, weight::Array{Int64,1}, capacity::Int64)

The knapsack problem is linked to the combinatorial optimization. In more detail all
array-elements are characterized by a given weight. The excersive is to maximize the the
value of subsequence of array-elements by not ooutbiding the `capacity`. For this purpose a
recurisve comparsion between old and new added items is designed wich continously update the
maximum reacahbele value sum. For more information see: [https://en.wikipedia.org/wiki/Knapsack_problem](https://en.wikipedia.org/wiki/Knapsack_problem)

# Arguments
- `array::Array{Int64,1}`: Array with the current values of each items.
- `weight::Array{Int64,1}`: Array with the current weoght of each items.
- `capacity::Int64`: Maximum weight to carry.


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> val = [60, 100, 120, 230, 220]
julia> wt = [10, 20, 25, 30, 25]
julia> W = 50
julia> ClassicAlgorithmsCollections.knapsack_solver(val, wt, W)
340
```
"""
function knapsack_solver(array::Array{Int64,1}, weight::Array{Int64,1}, capacity::Int64)
    n = length(array)

    if n == 1 || capacity == 0
        return 0
    end


    if (weight[n] > capacity)
        return knapsack_solver(array[1:n-1], weight[1:n], capacity)

    else
        item_new =
            array[n] + knapsack_solver(array[1:n-1], weight[1:n], capacity - weight[n])
        item_old = knapsack_solver(array[1:n-1], weight[1:n], capacity)
        if item_new > item_old
            return item_new
        end
        return item_old
    end
end

