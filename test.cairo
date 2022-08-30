%builtins output

from starkware.cairo.common.serialize import serialize_word

func main{output_ptr : felt*}():

    # Division in Cairo is done as, 
        # denomirator * x = nomirator

    # x = nomirator/denomirator
    serialize_word(6 / 3)
    serialize_word(7 / 3)

    # nomirator = x * denomirator
    serialize_word(1206167596222043737899107594365023368541035738443865566657697352045290673496 * 3)
    return ()
end
