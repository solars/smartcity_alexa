defmodule AlexaFurtTest do
  use ExUnit.Case
  doctest AlexaFurt

  test "greets the world" do
    assert AlexaFurt.hello() == :world
  end
end
