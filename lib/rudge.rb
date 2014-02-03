require 'rudge/abbreviations'

class Rudge

  # end of sentence marker
  EOS = "\001"

  def self.sentences(text)
    text = text.dup

    # initial split after punctuation, 
    # preserves trailing whitespace for the ellipsis correction
    text.gsub!(/([\.?!](?:\"|\'|\)|\]|\})?)(\s+)/) { $1 << EOS << $2 }

    # correct ellipsis marks and rows of stops
    text.gsub!(/(\.\.\.*)#{EOS}/) { $1 }

    # correct abbreviations - precompile regexp?
    text.gsub!(/(#{Rudge::Abbreviations.list.join("|")})\.#{EOS}/i) { $1 << '.' }

    # split on EOS marker, strip gets rid of trailing whitespace
    text.split(EOS).map { | sentence | sentence.strip }
  end
end
