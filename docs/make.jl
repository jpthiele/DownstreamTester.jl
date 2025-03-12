push!(LOAD_PATH, "../src")
using Documenter, DownstreamTester, DocumenterMermaid

makedocs(sitename = "DownstreamTester.jl")

deploydocs(
    repo= "github.com/jpthiele/DownstreamTester.jl.git"
)