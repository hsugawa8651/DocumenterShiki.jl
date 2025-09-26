# GitHub Pages デプロイ用のビルドスクリプト

using Documenter

include("./ShikiHighlighter.jl")

using .ShikiHighlighter

makedocs(;
    format=shiki_html(
        theme="github-light",
        dark_theme="dracula",
        load_themes=["github-light", "dracula"],
        # GitHub Pages用の設定
        prettyurls=get(ENV, "CI", "false") == "true",  # CI環境では prettyurls を有効化
        canonical="https://hsugawa8651.github.io/DocumenterShiki.jl/"
    ),
    sitename="Hello World",
    pages=["Home" => "index.md"],
    remotes=nothing
)

# ビルド後にShikiアセットを追加
add_shiki_assets("build")

# GitHub Pagesデプロイ用の.nojekyllファイル作成
# （Jekyllの処理を無効化し、_で始まるファイルも公開する）
touch(joinpath(@__DIR__, "build", ".nojekyll"))