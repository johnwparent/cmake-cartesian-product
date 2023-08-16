# Helper for cartesian_product
# DO NOT CALL DIRECTLY
macro(_loop list)
    set(LOOP_VAR${i} ${ARGN})
    foreach(item${i} IN LISTS ${list})
        if(LOOP_VAR${i})
            set(i_ ${i})
            math(EXPR i "${i} + 1" OUTPUT_FORMAT DECIMAL)
            _loop(${LOOP_VAR${i_}})
        else()
            set(vals${entries})
            foreach(a RANGE 1 ${i})
                list(APPEND vals${entries} ${item${a}})
            endforeach()
            list(APPEND PRODUCT vals${entries})
            math(EXPR entries "${entries} + 1" OUTPUT_FORMAT DECIMAL)
        endif()
    endforeach()
    math(EXPR i "${i} - 1" OUTPUT_FORMAT DECIMAL)
endmacro()

#######################
# Cartesian Product
#
# compute the cartesian product
# of all given list
#
# returns output in a variable
# accesible in the calling scope
# named PRODUCT.
# PRODUCT is a list of list entries
# each of which is the name
# of a variable referencing a
# sublist.
# Sublists can be accessed by iteration
# and doubly dereferencing the
# iteration variable
# i.e.
# foreach(list IN LISTS PRODUCT)
#   ${${list}}
# endforeach()
macro(cartesian_product)
    set(i 1)
    set(entries 1)
    set(PRODUCT)
    _loop(${ARGN})
endmacro()