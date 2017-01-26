require 'pp'

#Takes positive integer, and returns all primes in 2..n
#brute force, as it checks every number in range
def find_primes_brute(n)
  primes, curr = [2], 3

  if n > 2

    (curr..n).each do |i|

      is_prime = true
      primes.each do |p|
        if i % p == 0
          is_prime = false
          break
        end
      end

      primes << i if is_prime
    end
  end

  [1] + primes
end

#Use a Boolean array to mark which numbers are prime
#When a new prime is discovered, set all mulitples to not prime
def find_primes(n)
  is_prime, primes = Array.new(n + 1, true), []

  (2..n).each do |i|

    if is_prime[i]
      primes << i

      x = 2
      while ( (i * x) <= n )
        is_prime[i * x] = false
        x += 1
      end
    end
  end

  primes
end


pp find_primes_brute(7)
pp find_primes_brute(100)
pp find_primes(7)
pp find_primes(100)
pp find_primes(7)
pp find_primes(7)
