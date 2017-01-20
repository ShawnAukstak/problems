#Imagine a game (like baseball) where a player can score 1, 2 or 4 runs.
#Given a score "n", find the total number of ways score "n" can be reached.
def number_of_ways_to_score_n_runs(n)
  return score_n_runs_rec(n)
end

def score_n_runs_rec(n)
  return 0 if n < 0
  return 1 if n == 0

  return score_n_runs_rec(n - 4) + score_n_runs_rec(n - 2) + score_n_runs_rec(n - 1)
end


def score_n_run_dp(n)
  return 0 if n<= 0

  result = [0, 0, 0, 1]

  n.times do |i|
    current_sum = result[0] + result[2] + result[3]

    result[0] = result[1]
    result[1] = result[2]
    result[2] = result[3]
    result[3] = current_sum
  end

  return result[3]
end

n = 3
puts "#{n} #{number_of_ways_to_score_n_runs(n)}"

n = 5
puts "#{n} #{number_of_ways_to_score_n_runs(n)}"

puts "DP"

n = 3
puts "#{n} #{score_n_run_dp(n)}"

n = 5
puts "#{n} #{score_n_run_dp(n)}"
