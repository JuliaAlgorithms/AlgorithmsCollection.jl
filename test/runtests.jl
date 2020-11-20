using AlgorithmsCollection
using Test

@testset "BIT Manipulation" begin
    # Tests for BIT Manipulation
    arr = [8, 1, 2, 12, 45, 100, 43]
    @test AlgorithmsCollection.maximum_xor_subarray(arr) == 110
    @test AlgorithmsCollection.sum_of_bit_difference(arr) == 104
    @test AlgorithmsCollection.magic_number(5) == 130
    @test AlgorithmsCollection.swapping_even_odd_bits(23) == 43
    arr_three_one = [12, 1, 12, 3, 12, 1, 1, 2, 3, 3]
    @test AlgorithmsCollection.get_single_integer(arr_three_one) == 2
    @test AlgorithmsCollection.int2binary(131) == ([1, 0, 0, 0, 0, 0, 1, 1], 1)
    @test AlgorithmsCollection.count_total_bits(17) == 35
end

@testset "Dynamic Programming" begin
    # Tests for BIT Manipulation
    arr = [8, 1, 2, 12, 45, 100, 43]
    @test AlgorithmsCollection.lcs_length("AGGTAB", "GXTXAYB") == 4
    arr = [10, 22, 9, 33, 21, 50, 41, 60]
    AlgorithmsCollection.lis_length(arr) == 5
    str1 = "sunday"
    str2 = "saturday"
    AlgorithmsCollection.minumum_operations(str1, str2) == 3
    AlgorithmsCollection.number_of_steps(8, 3) == 81
    set = [3, 34, 4, 12, 5, 2]
    sum_true = 9
    sum_false = 19
    AlgorithmsCollection.subset_sum_test(set, sum_true) == true
    AlgorithmsCollection.subset_sum_test(set, sum_false) == false
    val = [60, 100, 120, 230, 220]
    wt = [10, 20, 25, 30, 25]
    W_1 = 50
    W_2 = 10
    AlgorithmsCollection.knapsack_solver(val, wt, W_1) == 340
    AlgorithmsCollection.knapsack_solver(val, wt, W_2) == 60
end

@testset "Graph Theory" begin
    # Tests for Graph Theory
    graph = Dict(1 => [2, 3], 2 => [3], 3 => [1, 4], 4 => [4])
    @test AlgorithmsCollection.breadth_first_search(graph, 3) == [3, 1, 4, 2]
    @test AlgorithmsCollection.depth_first_search(graph, 3) == [3, 1, 2, 4]

    graph_with_weights_1 =
        Dict(1 => [(3, -2)], 2 => [(1, 4), (3, 3)], 3 => [(4, 2)], 4 => [(2, -1)])
    @test AlgorithmsCollection.shortest_path_tree(graph_with_weights_1, 2, 4) ==
          ([0 -1 -2 0; 4 0 2 4; 5 1 0 2; 3 -1 1 0], [2, 1, 3, 4])

    graph_with_weights_2 =
        Dict(1 => [(3, -2)], 2 => [(1, 4), (3, 3)], 3 => [(4, 2)], 4 => [(2, -1), (3, -1)])

    @test AlgorithmsCollection.shortest_path_tree(graph_with_weights_2) ==
          [0 -1 -2 0; 4 0 2 4; 5 1 0 2; 3 -1 -1 0]

    graph_cycle_true = Dict(1 => [2], 2 => [3], 3 => [1, 4])
    @test AlgorithmsCollection.graph_cycle_check(graph_cycle_true) == true

    graph_cycle_false = Dict(1 => [2], 2 => [5], 3 => [1, 4])
    @test AlgorithmsCollection.graph_cycle_check(graph_cycle_false) == false

    graph_with_spanning_tree =
        Dict(1 => [(2, 10), (3, 6), (4, 5)], 2 => [(4, 15)], 3 => [(4, 4)])
    @test AlgorithmsCollection.minimum_spanning_tree(graph_with_spanning_tree) ==
          [3 4 4; 1 4 5; 1 2 10]

    graph_bridge = Dict(1 => [2, 3, 4], 2 => [1, 3], 3 => [1, 2], 4 => [1, 5], 5 => [4])
    @test AlgorithmsCollection.graph_bridge_check(graph_bridge) == [4 5; 1 4]

    word_list = ["GEEKS", "FOR", "QUIZ", "GO"]
    graph_boogle = Dict(
        1 => ["G", "I", "Z"],
        2 => ["U", "E", "K"],
        3 => ["Q", "S", "E"],
        4 => ["D", "O", "P"],
        5 => ["F", "O", "R"],
    )

    @test AlgorithmsCollection.boogle_word_check(graph_boogle, word_list) ==
          ["GEEKS", "QUIZ", "FOR"]
end


@testset "Number Theory" begin
    # Tests for Number Theory
    @test AlgorithmsCollection.modular_exponentiation(2, 3, 15) == 8
    @test AlgorithmsCollection.modular_inverse(3, 11) == 4
    @test AlgorithmsCollection.modular_inverse(3, 1) == 1
    @test AlgorithmsCollection.euler_totient(20) ==
          [1, 1, 2, 2, 4, 2, 6, 4, 6, 4, 10, 4, 12, 6, 8, 8, 16, 6, 18, 8]
    @test AlgorithmsCollection.sieve_of_eratosthenes(50) ==
          [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47]
    num = [3, 4, 5]
    rem = [2, 3, 1]
    @test AlgorithmsCollection.chinese_remainder_theorem(num, rem) == 11
end


@testset "Sorting & Searching" begin
    # Test for sorting and searching
    array_sorting = [64, 34, 25, 12, 22, 11, 90]
    ref_sorting = [11, 12, 22, 25, 34, 64, 90]
    @test AlgorithmsCollection.bubble_sorting(array_sorting) == ref_sorting
    @test AlgorithmsCollection.insertion_sorting(array_sorting) == ref_sorting
    @test AlgorithmsCollection.merge_sorting(array_sorting) == ref_sorting
    @test AlgorithmsCollection.heap_sorting(array_sorting) == ref_sorting
    @test AlgorithmsCollection.quick_sorting(array_sorting) == ref_sorting

    array_searching = [10, 11, 12, 14, 16, 18, 19, 20, 21, 22, 23, 24, 33, 35, 42, 47]
    target_searching = 12
    ref_searching = 3
    @test AlgorithmsCollection.binary_search(array_searching, target_searching) ==
          ref_searching
    @test AlgorithmsCollection.interpolation_search(array_searching, target_searching) ==
          ref_searching

    array_searching_pair = [10, 22, 28, 29, 30, 40]
    target_searching_pair = 56
    ref_searching_pair = (28, 29)
    @test AlgorithmsCollection.closest_pair_search(
        array_searching_pair,
        target_searching_pair,
    ) == ref_searching_pair

    array_unsorted_searching = [2, 5, 4, 7, 2, 8, 9, 3, 10, 2]
    target_unsorted_searching = 3
    ref_unsorted_searching = 8
    @test AlgorithmsCollection.binary_pivot_search(
        array_unsorted_searching,
        target_unsorted_searching,
    ) == ref_unsorted_searching
end

@testset "String & Array" begin
    old_string = "a!!!b.c79.d,e'f,ghi3###"
    reversed_string = "i!!!h.g79.f,e'd,cba3###"
    @test AlgorithmsCollection.reverse_pure_string(old_string) == reversed_string

    array_before_zigzag = [4, 3, 7, 8, 6, 2, 1, 10, 13, 3]
    array_after_zigzag = [3, 7, 4, 8, 2, 6, 1, 13, 3, 10]
    @test AlgorithmsCollection.zigzag_ordering(array_before_zigzag) == array_after_zigzag


    arr = [5, 1, 3, 4, 7]
    sum = 12

    arr = [5, 1, 3, 4, 7]
    sum = 12
    @test AlgorithmsCollection.count_triplet_elements(arr, sum) == 2

    array_pythagorean = [5, 1, 3, 4, 17, 8, 15, 2, 2, 13, 12]
    @test AlgorithmsCollection.count_pythagorean_elements(array_pythagorean) == 3


    arr_1 = [10, 15, 25]
    arr_2 = [5, 20, 30]
    sorted_combinations = [
        [10, 20],
        [10, 20, 25, 30],
        [10, 30],
        [15, 20],
        [15, 20, 25, 30],
        [15, 30],
        [25, 30]
    ]
    @test AlgorithmsCollection.combinations_of_2arrays(arr_1, arr_2) == sorted_combinations
    subarray_in_array = [10, 12, 11, 9, 13, 14, 17, 18, 15]
    @test AlgorithmsCollection.find_maxlength_subarray(subarray_in_array) == 5

    @test AlgorithmsCollection.smallest_subset4sum(subarray_in_array, 52) == 4
    @test AlgorithmsCollection.smallest_subset4sum(subarray_in_array, 2) == 1
    @test AlgorithmsCollection.smallest_subset4sum(subarray_in_array, 5555) == nothing

    sort_array = [1, 2, 5, 10, 20, 40]
    @test AlgorithmsCollection.find_smallest_nonelement(sort_array) == 4
          nothing

    sort_array = [1, 2, 5, 10, 20, 40]
    @test AlgorithmsCollection.find_smallest_nonelement(sort_array) == 4

    gradients_in_array = [100, 180, 260, 310, 40, 535, 695]
    @test AlgorithmsCollection.sum_of_postive_gradients(gradients_in_array) == 865
end

