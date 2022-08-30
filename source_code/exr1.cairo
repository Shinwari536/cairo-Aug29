%builtins output
from starkware.cairo.common.serialize import serialize_word

# Write a program poly.cairo that computes the expression: x3 + 23x2 + 45x + 67 ;
# where x=100, the output should be 1234567.

func main{output_ptr : felt*}():
    tempvar constVal1 = 23
    tempvar contVal2 = 45
    tempvar contVal3 = 67

    [ap] = 100; ap++
  

    [ap] = [ap - 1] * [ap - 1]; ap++ #x2 /ap + 1
    [ap] = [ap - 1] * [ap - 2]; ap++ #x3 /ap + 2
    [ap] = constVal1 * [ap - 2]; ap++ #23X2  /ap + 3
    [ap] = [ap - 2] + [ap - 1]; ap++ # X3 + 23X2  /ap + 4
    
    [ap] = contVal2 * [ap - 5]; ap++ # 45X /ap + 5
    [ap] = [ap - 2] + [ap - 1]; ap++ # X3 + 23X2 + 45X /ap + 6
    
    [ap] = [ap - 1] + contVal3; ap++ # X3 + 23X2 + 45X + 67 /ap + 7
    serialize_word([ap - 1])  
    return ()
end


