defmodule FreyaTest do
  use ExUnit.Case
  doctest Freya

  test "greets the world" do
    assert Freya.hello() == :world
  end
end
