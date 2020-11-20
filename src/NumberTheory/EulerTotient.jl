"""
    euler_totient(n::Int64)

Compute the positive integers up to a given integer n that are relatively prime to n; also
known as Euler's totient. For more information see: [https://en.wikipedia.org/wiki/Euler%27s_totient_function](https://en.wikipedia.org/wiki/Euler%27s_totient_function)


# Arguments
- `n::Int64`: Number of elements


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> ClassicAlgorithmsCollections.euler_totient(20)
[1, 1, 2, 2, 4, 2, 6, 4, 6, 4, 10, 4, 12, 6, 8, 8, 16, 6, 18, 8]
```
"""
function euler_totient(n::Int64)

    result = collect(Int64, 1:n)

    for i in 1:n
        m = i
        p = 2
        while m >= p^2
            if (m % p == 0)
                while (m % p == 0)
                    m = convert(Int64, m / p)
                end
                result[i] -= convert(Int64, result[i] / p)
            end
            p += 1
        end
        if m > 1
            result[i] -= convert(Int64, result[i] / m)
        end
    end
    return result
end
