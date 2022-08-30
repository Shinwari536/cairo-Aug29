%builtins output

from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.serialize import serialize_word

# Computes the sum of the memory elements at addresses:
#   arr + 0, arr + 1, ..., arr + (size - 1).
func array_sum(arr: felt*, size) -> (sum:felt):
    if size == 0:
        return (sum=0)
    end

    # size is not zero.
    let (sum_of_rest) = array_sum(arr=arr+1, size=size-1)
    return (sum = [arr] + sum_of_rest)
    # [arr] point to the first element of the array "arr"
end


# The main() function is the starting point of the Cairo program.

func main{output_ptr : felt*}():

    const ARRAY_SIZE = 7
    # #  Allocate an array.
    let (ptr) = alloc()

    # # Populate some values in the array.
    assert [ptr] = 10
    assert [ptr + 1] = 20
    assert [ptr + 2] = 14
    assert [ptr + 3] = 30 
    assert [ptr + 4] = 12 
    assert [ptr + 5] = 13 
    assert [ptr + 6] = 24


    # Call array_sum to compute the sum of the elements.
    let (sum) = array_sum(arr=ptr, size=ARRAY_SIZE)
    # Write the sum to the program output.
    serialize_word(sum)   

    return ()
end


