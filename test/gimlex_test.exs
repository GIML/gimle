defmodule GimlexTest do
  use ExUnit.Case

  @int_file """
  :num: my_int
  2
  """

  @float_file """
  :num: my_float
  2.4
  """

  @oneline_string_file """
  :text: my_string
  test
  """

  test "gimlex can parse integer" do
    assert Gimlex.parse_content(@int_file) == [{"my_int", 2}]
  end

  test "gimlex can parse float" do
    assert Gimlex.parse_content(@float_file) == [{"my_float", 2.4}]
  end

  test "gimlex can parse oneline string" do
    assert Gimlex.parse_content(@oneline_string_file) == [{"my_string", "test"}]
  end
end
