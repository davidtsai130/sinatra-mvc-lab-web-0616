require 'pry'

class PigLatinizer

attr_accessor :word

  def to_pig_latin(sentence)
    words = sentence.split
    words.each_with_object([]) do |word, array|
      array << piglatinize(word)
    end.join(" ")
  end

  def piglatinize(word)
    vowels = ["a", "e", "i", "o", "u"]

      if vowels.any? {|v| word[0].downcase.include?(v)}
        word += "way"
      else
        first_vowel = word.downcase.scan(/[aeiou]/).first
        until_vowel = word.partition(first_vowel).first
        word.sub!(until_vowel, "")
        word += until_vowel + "ay"
      end
    word
  end

end
