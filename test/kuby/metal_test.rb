require "test_helper"

class Kuby::MetalTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Kuby::Metal::VERSION
  end
end
