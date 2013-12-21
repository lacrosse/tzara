class Hash
  def generate_chain(limit=nil, branch=nil)
    branch ? (branch + ((self[branch.downcase] and limit > 1) ? " #{self.generate_chain(limit - 1, self[branch.downcase].sample.last)}" : "")) : self.generate_chain(limit, keys.sample)
  end

  def random_sentence(word_limit=nil)
    word_limit ||= rand(93) + 1
    sentence = self.generate_chain(word_limit).capitalize.strip
    sentence += "." unless sentence =~ /[[:punct:]]\z/
    sentence
  end

  def random_text(sentence_limit=nil)
    sentence_limit ||= rand(93) + 1
    Array.new(sentence_limit + 1) { self.random_sentence }
  end
end
