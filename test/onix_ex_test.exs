defmodule OnixExTest do
  use ExUnit.Case, async: true
  doctest OnixEx

  test "greets the world" do
    assert OnixEx.hello() == :world
  end
end
