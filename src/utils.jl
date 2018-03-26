function Base.hton(array::Array{T,1}) where {T<:Union{Real,Char}}
    return [hton(x) for x in array]
end

function Base.ntoh(array::Array{T,1}) where {T<:Union{Real,Char}}
    return [ntoh(x) for x in array]
end

"""
Parse the header and return it along with the input array minus the header. 
Returns the codec, the length of the decoded array, the parameter and the remainder
of the array
"""
function parseheader(input_array::Array{UInt8,1})
    codec, length, param = hton(reinterpret(Int32,input_array[1:12]))
    return codec,length,param,input_array[13:end]
end

""" 
Add the header to the appropriate array
"""
function addheader(input_array::Array{UInt8,1}, codec::Integer, length::Integer, param::Integer)
    return append!(reinterpret(UInt8,[ntoh(Int32(codec))]), 
    append!(reinterpret(UInt8,[ntoh(Int32(length))]), 
    append!(reinterpret(UInt8,[ntoh(Int32(param))]), input_array)))
end