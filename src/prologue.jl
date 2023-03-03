# V4L2.jl generated via Clang.Generators
# To generate this file, run the script in V4L2/src/generator.jl

## BEGIN prologue.jl

# additional methods to handle type punning in macros (e.g. C character literals)

CharToCuint(c::Char) = (isascii(c) ? Cuint(c) : error("Cannot convert non-ASCII Char to Cuint"))

Base.:<<(v::Char, s::Integer) = CharToCuint(v) << s
Base.:>>(v::Char, s::Integer) = CharToCuint(v) >> s

Base.:&(v::Char, s::Integer) = CharToCuint(v) & s
Base.:|(v::Char, s::Integer) = CharToCuint(v) & s

## END prologue.jl
