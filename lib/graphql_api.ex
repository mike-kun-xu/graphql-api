defmodule GraphqlApi do

  def request(url, query, header_list) do
    response = HTTPoison.post!(url, query, header_list)
    Jason.decode!(response.body)
  end
end
