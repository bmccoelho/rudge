require_relative "rudge/abbreviations"

class Rudge
  # end of sentence marker (before and after whitespace)
  EOSBW = "\001"
  EOSAW = "\002"

  def self.sentences(text, options={})
    text = text.dup

    # initial sentence markers, before and after whitespace
    text.gsub!(/([.?!](?:\"|\'|\)|\]|\})?)(\s+)/) { $1 << EOSBW << $2 << EOSAW }

    # remove sentence markers on ellipsis
    text.gsub!(/(\.\.\.*)#{EOSBW}(\s+)#{EOSAW}/) { $1 << $2 }

    # remove sentence markers on abbreviations
    abbreviations = Rudge::Abbreviations.list.join("|")
    text.gsub!(/(\s)(#{abbreviations})\.#{EOSBW}(\s+)#{EOSAW}/i) { $1 << $2 << "." << $3 }

    if options[:keep_trailling_whitespace]
      # split after whitespace, remove EOSBW marker
      text.split(EOSAW).map { | sentence | sentence.gsub(EOSBW, "") }
    else
      # remove initial whitespace, split at markers
      text.gsub(/\A\s+/, "").split(/#{EOSBW}\s+#{EOSAW}/)
    end
  end
end
