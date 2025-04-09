push!(LOAD_PATH, "../src")
using Documenter, DownstreamTester, DocumenterMermaid

makedocs(
    sitename = "DownstreamTester.jl",
    pages = [
        "Home" => "index.md",
        "Workflows" => [
            "Nightly" => "workflows/nightly.md",
        ],
        "Setup" => [
            "Config File" => "setup/config.md",
            "Personal Access Token" => "setup/pat.md",
            "Logging Branches" => "setup/logging.md",
            "Nightly GitHub Action" => "setup/nightly_action.md",
        ],
        "Changelog" => "changes.md",
    ]
)

deploydocs(
    repo = "github.com/jpthiele/DownstreamTester.jl.git"
)
