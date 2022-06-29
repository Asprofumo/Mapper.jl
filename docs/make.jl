if Base.HOME_PROJECT !== nothing
    Base.HOME_PROJECT[] = abspath(Base.HOME_PROJECT[])
end

using Documenter, Mapper
makedocs(
    format = Documenter.HTML(),
    modules = [Mapper],
    sitename = "Mapper",
    pages = ["README.md", "API Reference" => "index.md"]
)
deploydocs(
    repo = "https://github.com/Asprofumo/mapper.jl.git"
)