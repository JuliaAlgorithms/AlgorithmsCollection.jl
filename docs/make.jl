using AlgorithmsCollection
using Documenter

makedocs(;
    modules=[AlgorithmsCollection],
    authors="Julia-Algorithms <Julia-Algorithms@gmail.com>. Anselm Hahn <Anselm.Hahn@gmail.com> and contributors",
    repo="https://github.com/Julia-Algorithms/AlgorithmsCollection.jl/blob/{commit}{path}#L{line}",
    sitename="AlgorithmsCollection.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://Julia-Algorithms.github.io/AlgorithmsCollection.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "Guide" => "man/guide.md",
        "Algorithms" => Any[
            "Bit Manipulation" => "man/BitManipulation.md",
            "Dynamic Programming" => "man/DynamicProgramming.md",
            "Graph" => "man/Graph.md",
            "Number Theory" => "man/NumberTheory.md",
            "Sorting and Searching" => "man/SortingAndSearching.md",
            "String and Arrays" => "man/StringsAndArrays.md",
        ],
    ],
)

deploydocs(; repo="github.com/Julia-Algorithms/AlgorithmsCollection.jl",
    versions=["stable" => "v^", "v#.#", "dev" => "dev"],
    push_preview=true,)
