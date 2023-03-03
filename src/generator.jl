using Clang.Generators

cd(@__DIR__)

options = load_options(joinpath(@__DIR__, "generator.toml"))

args = get_default_args()  # Note you must call this function first and then append your own flags

# add compiler flags, e.g. "-DXXXXXXXXX"
# push!(args, "-I/usr/include")
# push!(args, "-I../include")

headers = [
	# "v4l2_includes.h",
	"/usr/include/linux/videodev2.h",
]

# create context
ctx = create_context(headers, args, options)

# run generator
build!(ctx)
