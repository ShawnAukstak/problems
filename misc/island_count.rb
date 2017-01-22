# @param {Character[][]} grid
# @return {Integer}

#101
#count = 1

def num_islands(m)
   return 0 if m.length == 0
   
   count = 0

   for r in 0..(m.length - 1)
      for c in 0..(m[0].length - 1)
         if m[r][c] == '1'
            count += 1
            remove_island(m, r, c)
         end
      end
   end
      
   return count
end

#Removes island, setting all 1's to 0's
def remove_island(m, r, c)
   #check if r or c index out of bounds.
   return if r < 0 || c < 0
   return if r > m.length - 1 || c > m[0].length - 1
   
   #Not an island, nothing to do
   return if m[r][c] == '0'
   
   m[r][c] = '0'
   
   #Up
   remove_island(m,r - 1, c)
   
   #Down
   remove_island(m, r + 1, c)
   
   #Left
   remove_island(m, r, c - 1)
   
   #Right
   remove_island(m, r, c + 1)
end