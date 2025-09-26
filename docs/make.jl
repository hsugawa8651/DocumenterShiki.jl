
using Documenter

include("./ShikiHighlighter.jl")

using .ShikiHighlighter


makedocs(;
    format=shiki_html(
        theme="one-light",  # より高コントラストなライトテーマ
        dark_theme="github-dark",  # GitHubのダークテーマ（より互換性が高い）
        load_themes=["one-light", "github-dark"]
    ),
    sitename="Hello World",
    pages=["Home" => "index.md"],
    remotes=nothing  # Disable remote source links for local build
)

# ビルド後にShikiアセットを追加
add_shiki_assets("build")

# For Github Actions
# add_shiki_assets(joinpath(@__DIR__, "build"))
# deploydocs(repo="github.com/username/MyPackage.jl.git")
