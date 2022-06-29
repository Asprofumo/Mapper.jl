if Base.HOME_PROJECT !== nothing
    Base.HOME_PROJECT[] = abspath(Base.HOME_PROJECT[])
end

using Documenter, Mapper
using DocumenterTools: Themes
makedocs(
    format = Documenter.HTML(),
    modules = [Mapper],
    sitename = "Mapper.jl",
    pages = [
        "Introduzione" => "intro.md",
        "Stato dell'arte" => "stateart.md",
        "API Reference" => "index.md",
        "Dependecy Graph" => "grafodipendenze.md",
        "BackGround Tecnologico" => "background.md",
        "Applicazione Pratica" => "applicazione.md"
        "Conclusione" => "conclusioni.md",
        "Lar Introduction" => "lar.md",
        "General Informations" => "mapper.md"
        ]
)
deploydocs(
    repo = "https://github.com/Asprofumo/mapper.jl.git"
)

Themes.compile("docs/src/documenter-dark.scss", "docs/build/assets/themes/documenter-dark.css")
Themes.compile("docs/src/documenter-light.scss", "docs/build/assets/themes/documenter-light.css")