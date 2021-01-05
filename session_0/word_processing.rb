# The function `lower_case` takes an array of strings and converts
# any non-lower case alphabet (A..Z) to corresponding lower case
# alphabet
def lower_case(words)
  array = Array.new
  words.each do |word|
    array.append(word.downcase)
  end
  array
end

# Similar to `lower_case`, this function modifies the array in-place
# and does not return any value.
def lower_case!(words)
  i=0
  while i< words.length() do
    words[i]=words[i].downcase
    i+=1
  end
end

# Given a prefix and an array of words, return an array containing
# words that have same prefix.
#
# For example:
# words_with_prefix('apple', ['apple', 'ball', 'applesauce']) would
# return the words 'apple' and 'applesauce'.
def words_with_prefix(prefix, words)
  array = Array.new
  words.each do |word|
    if word.start_with?prefix
    array.append(word)
    end
  end
  array
end

# The similarity score between two words is defined as the length of
# largest common prefix between the words.
#
# For example:
# - Similarity of (bike, bite) is 2 as 'bi' is the largest common prefix.
# - Similarity of (apple, bite) is 0 as there are no common letters in
#   the prefix
# - similarity of (applesauce, apple) is 5 as 'apple' is the largest
#   common prefix.
# 
# The function `similarity_score` takes two words and returns the
# similarity score (an integer).
def similarity_score(word_1, word_2)
  commonPrefix=''
  i=0
  while i < word_1.size do
    if word_1[i]==word_2[i]
      commonPrefix+=word_1[i]
    else
      break
    end
    i+=1
  end
  commonPrefix.size
end

# Given a chosen word and an array of words, return an array of word(s)
# with the maximum similarity score in the order they appear.
def most_similar_words(chosen_word, words)
  maxScore=0
  array=Array.new
  words.each do |word|
    score=similarity_score(chosen_word,word)
    if score==maxScore && maxScore>0
      array.append(word)
    elsif score>maxScore
      array=Array.new([word])
      maxScore=score
    end
  end
  array
end