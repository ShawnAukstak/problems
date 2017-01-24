#Find smallest subarray in text contains all in set keywords, e.g.
#["The", "fish", "can", "swim", "very" fast down stream where the fish can learn how to swim"]
#["fish", "swim]
#output: [1, 3]


def smallest_subarray_covering_all_values(text, keywords)
  left, right = 0, 0
  result = [-Float::INFINITY, Float::INFINITY]
  keyword_counts = {}

  while right < text.length

    #Expand until constraint is satisified
    while right < text.length && keyword_counts.size < keywords.size
      curr = text[right]

      if keywords.include? curr
        if keyword_counts[curr]
          keyword_counts[curr] += 1
        else
          keyword_counts[curr] = 1
        end
      end

      right += 1
    end

    while keyword_counts.size >= keywords.length
      if ((right - left - 1) < result[1] - result[0])
        result = [left, right - 1]
      end

      #Move left and update counts
      curr = text[left]

      if keyword_counts[curr]
        keyword_counts[curr] -= 1

        if keyword_counts[curr] == 0
          keyword_counts.delete curr
        end
      end

      left += 1
    end

  end

  result
end


text = "The fish can swim very fast down stream where the fish can learn how to swim".split(' ')
keywords = ["fish", "swim"]
puts smallest_subarray_covering_all_values(text, keywords)