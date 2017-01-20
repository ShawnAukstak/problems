require 'pp'

#17.1 Number of ways to score, combinations
SCORES = [2, 3, 7]

def ways_to_score(score)
  solutions = Array.new(score + 1, 0)
  solutions[0] = 1

  SCORES.each do |s|
    for i in s..score
      solutions[i] += solutions[i - s]
    end
  end

  solutions[-1]
end

def ways_to_score_perm(score)
    solutions = Array.new(score + 1, 0)
    solutions[0] = 1

    for i in 0..score
      SCORES.each do |s|
        if i >= s
          solutions[i] += solutions[i - s]
        end
      end
    end

    solutions[-1]
end

def ways_to_score_perm_brute(score)
  return ways_to_score_perm_rec(score)
end

def ways_to_score_perm_rec(score)
  return 0 if score < 0

  if score == 0
    return 1
  end

  ways = 0

  SCORES.each do |s|
    ways += ways_to_score_perm_rec(score - s)
  end

  return ways
end

#Variant #1
#0, 3 => 1
#3, 3 => 2 (a scores 3, b scores 3, and visa-versa)
#6, 3 => aab, aba, baa
#6, 3 => aab, aba, baa, 222b 22b2 2b22 b222
#9 =>2223, 2232, 2322, 3222, 333
=begin
4, 3

[
  [1, 0, 0, 0],
  [0, 0, 0, 0],
  [1, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
]

solutions[0][0]
solutions[2][0]


2, 2

[
  [1, 0, 0, 0],
  [0, 0, 0, 0],
  [1, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
]

[
[1,0,1],
[0,0,0],
[1,0,2]
]

def team_scoring_permutations(score_a, score_b)

  #need solutions array that includes all scores
  solutions = Array.new(score_a + 1) { Array.new(score_b + 1, 0) }
  solutions[0][0] = 1

  for i in 0..score_a
    for j in 0..score_b

      SCORES.each do |s|
        r, c = 0,0

        #For potential score of 2,0.. it needs to check

        if i >= s || j >= s
          r = i - s
          c = j - s
          puts "#{i} #{j} #{r} #{c}"
          if r >= 0 && c >= 0
            solutions[i][j] += solutions[r][c]
          end
        end

      end

    end
  end

  pp solutions
  return solutions[-1][-1]
end
=end

def team_scoring_permutations(score_a, score_b)
  memo = Array.new(score_a + 1) { Array.new(score_b + 1, 0) }
  team_scoring_permutations_rec(score_a, score_b, memo)
end

def team_scoring_permutations_rec(score_a, score_b, memo)
  return 0 if score_a < 0 || score_b < 0

  if memo[score_a][score_b] > 0
    return memo[score_a][score_b]
  end

  ways = 0
  if score_a > 0 && score_b > 0
    SCORES.each do |s|
      ways += team_scoring_permutations_brute(score_a - s, score_b) + team_scoring_permutations_brute(score_a, score_b - s)
    end
  elsif score_a > 0
    SCORES.each do |s|
      ways += team_scoring_permutations_brute(score_a - s, score_b)
    end
  else
    SCORES.each do |s|
      ways += team_scoring_permutations_brute(score_a, score_b - s)
    end
  end

  memo[score_a][score_b] = ways
  return ways
end

def team_scoring_permutations_brute(score_a, score_b)
  return 0 if score_a < 0 || score_b < 0
  return 1 if score_a == 0 && score_b == 0

  ways = 0

  if score_a > 0 && score_b > 0
    #try each score
    SCORES.each do |s|
      ways += team_scoring_permutations_brute(score_a - s, score_b) + team_scoring_permutations_brute(score_a, score_b - s)
    end
  elsif score_a > 0
    #try each score
    SCORES.each do |s|
      ways += team_scoring_permutations_brute(score_a - s, score_b)
    end
  else
    #try each score
    SCORES.each do |s|
      ways += team_scoring_permutations_brute(score_a, score_b - s)
    end
  end

  return ways
end

#This solution is not done!!
def team_scoring_lead_changes_brute(score_a, score_b)
  team_scoring_lead_changes_rec(score_a, score_b, 0)
end

def team_scoring_lead_changes_rec(score_a, score_b, changes)
  return 0 if score_a < 0 || score_b < 0
  return changes if score_b == 0 && score_a == 0

  lead_changes = Array.new(SCORES.length, 0)

  if score_a > score_b
    SCORES.each_with_index do |s, i|
      changed = (score_a - s < score_b) ? 1 : 0
      lead_changes[i] = team_scoring_lead_changes_rec(score_a - s, score_b, changes + changed)
    end
  else
    SCORES.each_with_index do |s, i|
      changed = (score_b - s < score_a) ? 1 : 0
      lead_changes[i] = team_scoring_lead_changes_rec(score_a, score_b - s, changes + changed)
    end
  end

  lead_changes.sort!
  lead_changes[-1]
end

puts "Number of ways to score combinations #{ways_to_score(5)}"
puts "Number of ways to score permutations 6 #{ways_to_score_perm(6)}"
puts "Number of ways to score permutations 6 #{ways_to_score_perm_brute(6)}"
puts "Number of ways to team permutations 6 3 #{team_scoring_permutations(6, 3)}"
puts "Number of ways to team permutations brute 6 3 #{team_scoring_permutations_brute(6, 3)}"
puts "Number of ways to team lead changes 10 6 #{team_scoring_lead_changes_brute(2, 2)}"
