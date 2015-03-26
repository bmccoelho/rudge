require "test/unit"
require_relative "../lib/rudge"

class RudgeTest < Test::Unit::TestCase
  def test_one_sentence
    text      = "Hello World."
    sentences = Rudge.sentences(text)

    assert_equal 1,              sentences.size
    assert_equal "Hello World.", sentences[0]
  end

  def test_exclamation_mark
    text      = "Hello World!"
    sentences = Rudge.sentences(text)

    assert_equal 1,              sentences.size
    assert_equal "Hello World!", sentences[0]
  end

  def test_question_mark
    text      = "Hello World?"
    sentences = Rudge.sentences(text)

    assert_equal 1,    sentences.size
    assert_equal "Hello World?", sentences[0]
  end

  def test_trimmed_sentence
    sentences = Rudge.sentences("  to be trimmed.  ")

    assert_equal 1,                sentences.size
    assert_equal "to be trimmed.", sentences[0]
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
    sentences = Rudge.sentences("Hi, Mr. White! Check out mr. Pink black.")

    assert_equal 2,                           sentences.size
    assert_equal "Hi, Mr. White!",            sentences[0]
    assert_equal "Check out mr. Pink black.", sentences[1]
  end

  def test_a_very_stange_text
    text = "\t\n  The quick brown box. \t\t  \n Jumps over Mr. poo.\n\nTwice... and goes to www.seedrs.com.  \n\t"
    sentences = Rudge.sentences(text)

    assert_equal 3,                                      sentences.size
    assert_equal "The quick brown box.",                 sentences[0]
    assert_equal "Jumps over Mr. poo.",                  sentences[1]
    assert_equal "Twice... and goes to www.seedrs.com.", sentences[2]
  end

  def test_one_sentence_keepping_whitespace
    text      = "Hello World."
    sentences = Rudge.sentences(text, keep_trailling_whitespace: true)

    assert_equal 1,              sentences.size
    assert_equal "Hello World.", sentences[0]
  end

  def test_exclamation_mark_keepping_whitespace
    text      = "Hello World!"
    sentences = Rudge.sentences(text, keep_trailling_whitespace: true)

    assert_equal 1,              sentences.size
    assert_equal "Hello World!", sentences[0]
  end

  def test_question_mark_keepping_whitespace
    text      = "Hello World?"
    sentences = Rudge.sentences(text, keep_trailling_whitespace: true)

    assert_equal 1,              sentences.size
    assert_equal "Hello World?", sentences[0]
  end

  def test_untrimmed_sentence_keepping_whitespace
    sentences = Rudge.sentences("  not to be trimmed.  ", keep_trailling_whitespace: true)

    assert_equal 1,                     sentences.size
    assert_equal "  not to be trimmed.  ", sentences[0]
  end

  def test_two_sentences_with_whitespace_keepping_whitespace
    sentences = Rudge.sentences("1st with whitespace.   2nd sentence. ", keep_trailling_whitespace: true)

    assert_equal 2,                         sentences.size
    assert_equal "1st with whitespace.   ", sentences[0]
    assert_equal "2nd sentence. ",          sentences[1]
  end

  def test_two_sentences_with_url_keepping_whitespace
    sentences = Rudge.sentences("Sentence Boundary? Check it on www.google.com.", keep_trailling_whitespace: true)

    assert_equal 2,                             sentences.size
    assert_equal "Sentence Boundary? ",         sentences[0]
    assert_equal "Check it on www.google.com.", sentences[1]
  end

  def test_two_sentences_with_abbreviations_keepping_whitespace
    sentences = Rudge.sentences("Hi, Mr. White! Check out mr. Pink black.", keep_trailling_whitespace: true)

    assert_equal 2,                           sentences.size
    assert_equal "Hi, Mr. White! ",           sentences[0]
    assert_equal "Check out mr. Pink black.", sentences[1]
  end

  def test_a_very_stange_text_keepping_whitespace
    text = "\t\n  The quick brown box. \t\t  \n Jumps over Mr. poo.\n\nTwice... and goes to www.seedrs.com.  \n\t"
    sentences = Rudge.sentences(text, keep_trailling_whitespace: true)

    assert_equal 3,                                            sentences.size
    assert_equal "\t\n  The quick brown box. \t\t  \n ",       sentences[0]
    assert_equal "Jumps over Mr. poo.\n\n",                    sentences[1]
    assert_equal "Twice... and goes to www.seedrs.com.  \n\t", sentences[2]
  end
end
