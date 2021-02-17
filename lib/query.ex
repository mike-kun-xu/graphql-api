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
  def getRepo(repo_owner,repo_name) do
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
  def getAllTags(repo_owner,repo_name) do
    query =
      """
      query{
        repository(owner:"#{repo_owner}",name:"#{repo_name}"){
          id
          releases(orderBy:{direction:DESC,field:NAME},first:100){
              nodes{
                  url
                  tag{
                      name
                  }
              }
          }
        }
      }
      """
      encode(query)
  end
  def getUrlByTag(repo_owner,repo_name,tag) do
    query =
      """
      query{
        repository(owner:"#{repo_owner}",name:"#{repo_name}"){
          release(tagName:"#{tag}"){
            releaseAssets(first:100){
              nodes{
                name
                downloadUrl
              }
            }
          }
        }
      }
      """
      encode(query)
  end
  def encode(query) do
    Jason.encode!(%{query: query})
  end
end
