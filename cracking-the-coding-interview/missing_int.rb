#arr [1,2,4,0]
#ints { 1: true, 2: true, 4: true, 0: true }

#runtime O(n)
#memory O(n)
def missing_int(arr)
   if arr.length == (MAX_INT + 1)
      return nil
   end
   
   ints = Hash.new
   
   for i in 0..arr.length - 1
      ints[arr[i]] = true
   end
   
   for i in 0..MAX_INT
      if !ints[i]
         return i
      end
   end
   
   return nil
end

#O(nLogn)
def missing_int(arr)
   arr.sort!

   if arr.length == (MAX_INT + 1)
      return nil
   end
   
   expect_num = 0
   for i in 0..last_index
      if arr[i] != expected_num
         return expected_num
      end
      
      expected_num += 1
   end
   
   return nil
end