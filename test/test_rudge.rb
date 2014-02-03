require 'test/unit'
require 'rudge'

class RudgeTest < Test::Unit::TestCase
  
  def test_one_sentence
    text = "Hello World."
    sentences = Rudge.sentences(text)
    assert_equal 1,    sentences.size
    assert_equal text, sentences[0]
  end

  def test_exclamation_mark
    text = "Hello World!"
    sentences = Rudge.sentences(text)
    assert_equal 1,    sentences.size
    assert_equal text, sentences[0]
  end

  def test_question_mark
    text = "Hello World!"
    sentences = Rudge.sentences(text)
    assert_equal 1,    sentences.size
    assert_equal text, sentences[0]
  end

  def test_two_sentences_with_whitespace
    sentences = Rudge.sentences("1st with whitespace. 2nd sentence.")

    assert_equal 2,                      sentences.size
    assert_equal "1st with whitespace.", sentences[0]
    assert_equal "2nd sentence.",        sentences[1]
  end

  def test_two_sentences_with_url
    sentences = Rudge.sentences("Sentence Boundary? Check it on www.google.com.")

    assert_equal 2,                             sentences.size
    assert_equal "Sentence Boundary?",          sentences[0]
    assert_equal "Check it on www.google.com.", sentences[1]
  end

  def test_two_sentences_with_abbreviations
    sentences = Rudge.sentences("Hi, mr. White! Check out mr. Pink black.")

    assert_equal 2,                          sentences.size
    assert_equal "Hi, mr. White!",           sentences[0]
    assert_equal "Check out mr. Pink black.", sentences[1]
  end


end
