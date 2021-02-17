defmodule GraphqlApi do
alias GraphqlApi.Header
alias GraphqlApi.Query

  def getAllTags(repo_owner, repo_name) do
    header_list = getHeaderList()
    query = Query.getAllTags(repo_owner,repo_name)
    response = HTTPoison.post!(getUrl(), query, header_list) |> handleRes()
    response["data"]["repository"]["releases"]["nodes"]
  end

  def getUrlByTag(repo_owner, repo_name, tag) do
    header_list = getHeaderList()
    query = Query.getUrlByTag(repo_owner, repo_name, tag)
    response = HTTPoison.post!(getUrl(), query, header_list) |> handleRes()
    response["data"]["repository"]["release"]["releaseAssets"]["nodes"]
  end

  defp getHeaderList() do
    Header.getData("lib/header/header_list.json", "Authorization")
  end

  defp getUrl(), do: "https://api.github.com/graphql"

  defp handleRes(response) do
    case response.status_code do
      403 -> raise(response.body)
      200 -> Jason.decode!(response.body)
      _ -> raise(Jason.decode!(response.body)["message"])
    end
  end
end
