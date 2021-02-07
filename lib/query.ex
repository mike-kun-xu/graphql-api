defmodule GraphqlApi.Query do
  def getViewer() do
    query =
    """
    query{
      viewer{
        login
        }
      }
    """
    encode(query)
  end
  def getRepo(repo_owner, repo_name) do
    query =
    """
      query{
        repository(owner: "#{repo_owner}", name: "#{repo_name}"){
          id
          name
          url
          description
        }
      }
    """
    encode(query)
  end
  def encode(query) do
    Jason.encode!(%{query: query})
  end
end
