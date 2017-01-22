

#general way of finding substrings with some restrictions using two additional cursor variables


int findSubstring(string s){
        vector<int> map(128,0);
        int counter; // check whether the substring is valid
        int begin=0, end=0; //two pointers, one point to tail and one  head
        int d; //the length of substring

        for() { /* initialize the hash map here */ }

        while(end<s.size()){

            if(map[s[end++]]-- ?){  /* modify counter here */ }

            while(/* counter condition */){ 
                 
                 /* update d here if finding minimum*/

                //increase begin to make it invalid/valid again
                
                if(map[s[begin++]]++ ?){ /*modify counter here*/ }
            }  

            /* update d here if finding maximum*/
        }
        return d;
  }


def find_substring(s)
  hash = Hash.new(0)

  left, right = 0, 0 #Indexes for left and right of the window
  #counter variable, which could be 0 or a length, depending
  counter = s.length
  substring_length = Float:Infinity

  #Initialize hash map here
  #For example, count of each character t.each_each do { |c| hash[c] += 1 }

  while (left < s.length)

    #if hash[s[right]] ? condition and counter update
    #e.g. counter -= 1 if (hash[s[right]] > 0)

    #Increase window width, remove count from hash as it's included in window.
    hash[s[right]] -= 1
    right += 1

    #counter condition, e.g.
    while(/* counter condition */){ 
      #Update substring_length here if finding minimum

      #increase left to make it invalid/valid again

    end

      #update substring_length here if finding max.
  end

  return substring_length
end

INT_MAX = 999999
#s = "a"
#t = "t"

def min_window(s, t)
  hash = Hash.new(0)

  #Initialize the hash here - includes count of characters.
  t.each_char do |c|
    hash[c] += 1
  end

  counter = t.length
  left, right, head = 0, 0, 0
  d = INT_MAX

  while(right < s.length)

    #Update counter if hash is in there.
    #if(map[s[end++]]-->0) counter--; //in t
    counter -= 1 if (hash[s[right]] > 0)

    #Increase window width, remove count from hash as it's included in window.
    hash[s[right]] -= 1
    right += 1

    #Counter condition
    while(counter == 0) 
      #if(end-begin<d)  d=end-(head=begin);
      #if(map[s[begin++]]++==0) counter++;  //make it invalid

      if ((right - left) < d)
          head = left
          d = right - head
      end

      if (hash[s[left]] == 0)
          counter += 1 #make invalid
      end

      hash[s[left]] += 1
      left += 1

    end
  end

  return d == INT_MAX ? "" : s[head, d]
end
