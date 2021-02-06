defmodule GraphqlApiTest do
  use ExUnit.Case
  doctest GraphqlApi

  test "greets the world" do
    assert GraphqlApi.hello() == :world
  end
end
