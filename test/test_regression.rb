require "test/unit"
require_relative "../lib/rudge"

class RudgeRegressionTest < Test::Unit::TestCase
  def test_regression
    sentences = Rudge.sentences("Hello Project. Goodbye.")

    assert_equal 2,                sentences.size
    assert_equal "Hello Project.", sentences[0]
    assert_equal "Goodbye.",       sentences[1]
  end
end
