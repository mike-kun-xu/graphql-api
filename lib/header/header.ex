defmodule GraphqlApi.Header do

  def getData(filename, field) when is_list(field) do
    filename
    |> File.read!()
    |> Jason.decode!()
    |> Map.take(field)
    |> Map.to_list()
  end
  def getData(filename, field) do
    getData(filename, [field])
  end
end
