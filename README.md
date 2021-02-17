# GraphqlApi

**TODO: Add more functionalities**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `graphql_api` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:graphql_api, "~> 0.1.0"}
  ]
end
```

## Usage

```elixir
iex> GraphqlApi.getAllTags("repo_owner","repo_name")
[
  %{
    "tag" => %{"name" => "repo_name_1.0.2"},
    "url" => "https://repo.url/releases/tag/repo_name_1.0.2"
  },
  %{
    "tag" => %{"name" => "repo_name_1.0.1"},
    "url" => "https://repo.url/releases/tag/repo_name_1.0.1"
  }
]
iex> GraphqlApi.getUrlByTag("repo_owner","repo_name","tag")
[
  %{
    "downloadUrl" => "https://download.url/releases/download/repo_name_1.0.1/download_file",
    "name" => "repo_name_1.0.1_download_file"
  }
]
```

## Additional file

A headerInfo.json is needed in directory header in order to have authentication.
