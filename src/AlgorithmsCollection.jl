module AlgorithmsCollection

# Bit-Manipulation
include("BitManipulation/CountTotalBits.jl")
export count_total_bits
include("BitManipulation/GetSingleInteger.jl")
export get_single_integer
include("BitManipulation/Integer2Binary.jl")
export int2binary
include("BitManipulation/MagicNumber.jl")
export magic_number
include("BitManipulation/MaximumXorSubarray.jl")
export maximum_xor_subarray
include("BitManipulation/SumOfBitDifference.jl")
export sum_of_bit_difference
include("BitManipulation/SwappingBits.jl")
export swapping_even_odd_bits

# Dynamic-Programming
include("DynamicProgramming/KnackPackSolver.jl")
export knack_pack_solver
include("DynamicProgramming/LongestCommonSubsequence.jl")
export longest_common_subsequence
include("DynamicProgramming/LongestIncreasingSubsequence.jl")
export longest_increasing_subsequence
include("DynamicProgramming/MinimumOperations.jl")
export minimum_operations
include("DynamicProgramming/NumberOfSteps.jl")
export number_of_steps
include("DynamicProgramming/SubsetSumTest.jl")
export subset_sum_test

# Graph
include("Graph/BoogleWordCheck.jl")
export boogle_word_check
include("Graph/BreadthFirstSearch.jl")
export breadth_first_search
include("Graph/DepthFirstSearch.jl")
export depth_first_search
include("Graph/GraphBridgeCheck.jl")
export graph_bridge_check
include("Graph/GraphCycleCheck.jl")
export graph_cycle_check
include("Graph/MinimumSpanningTree.jl")
export minimum_spanning_tree
include("Graph/ShortestPathTree.jl")
export shortest_path_tree

# Number-Theory
include("NumberTheory/ChineseRemainderTheorem.jl")
export chinese_remainder_theorem
include("NumberTheory/EulerTotient.jl")
export euler_totient
include("NumberTheory/ModularExponentiation.jl")
export modular_exponentiation
include("NumberTheory/ModularInverse.jl")
export modular_inverse
include("NumberTheory/SieveOfEratosthenes.jl")
export sieve_of_eratosthenes

# Sorting and Searching
include("SortingAndSearching/BinaryPivotSearch.jl")
export binary_pivot_search
include("SortingAndSearching/BinarySearch.jl")
export binary_search
include("SortingAndSearching/BubbleSorting.jl")
export bubble_sorting
include("SortingAndSearching/ClosetPairSearch.jl")
export closet_pair_search
include("SortingAndSearching/HeapSorting.jl")
export heap_sorting
include("SortingAndSearching/InsertionSorting.jl")
export insertion_sorting
include("SortingAndSearching/InterpolationSearch.jl")
export interpolation_search
include("SortingAndSearching/MergeSorting.jl")
export merge_sorting
include("SortingAndSearching/QuickSorting.jl")
export quick_sorting

# String and Array
include("StringAndArray/CombinationsOf2Arrays.jl")
export combinations_of_2arrays
include("StringAndArray/CountPythagoreanElements.jl")
export count_pythagorean_elements
include("StringAndArray/CountTripletElements.jl")
export count_triplet_elements
include("StringAndArray/FindMaxLengthSubarray.jl")
export find_max_length_subarray
include("StringAndArray/FindSmallestNonelement.jl")
export find_smallest_nonelement
include("StringAndArray/ReversePureString.jl")
export reverse_pure_string
include("StringAndArray/SmallestSubset4Sum.jl")
export smallest_subset4_sum
include("StringAndArray/SumOfPositiveGradients.jl")
export sum_of_positive_gradients
include("StringAndArray/ZigZagOrdering.jl")
export zig_zag_ordering

end
