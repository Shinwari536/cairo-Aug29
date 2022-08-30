%builtins output

from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.serialize import serialize_word

# Computes the product of the memory elements at addresses:
func array_even_numbers_product(arr: felt*, size) -> (sum:felt):
    if size == 1:
        return (sum=1)
    end

     if size == 0:
        return (sum=1)
    end

    # size is not zero.
    let (sum_of_rest) = array_even_numbers_product(arr=arr+2, size=size-2)
    return (sum = [arr] * sum_of_rest)
    # [arr] points to the first element of the array "arr"
end


# The main() function is the starting point of the Cairo program.

func main{output_ptr : felt*}():
  
    const ARRAY_SIZE = 8
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
    assert [ptr + 7] = 20

    # Call array_even_numbers_product to compute the product of the elements.
    let (product) = array_even_numbers_product(arr=ptr, size=ARRAY_SIZE)
    # Write the product to the program output.
    serialize_word(product)

    return ()
end


