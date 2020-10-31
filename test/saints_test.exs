defmodule SaintsTest do
  use ExUnit.Case
  doctest Saints

  test "greets the world" do
    assert Saints.hello() == :world
  end
end
