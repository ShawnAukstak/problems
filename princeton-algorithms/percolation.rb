
#By convention, the row and column indices i and j are integers between 1 and n, where (1, 1) is the upper-left site.
class PercolationQuickFind

  #create n-by-n grid, with all sites blocked
  #The constructor should take time proportional to N2;
  def initialize(size)
  end

  #open site (row i, column j) if it is not open already
  def open(i,j)
  end

  #is site (row i, column j) open?
  def is_open?(i, j)
  end

  #is site (row i, column j) full?
  def is_full?(i, j)
  end

  #does the system percolate?
  def percolates?
  end
end
#TODO -
  #Throw a java.lang.IndexOutOfBoundsException if any argument to open(), isOpen(), or isFull() is outside its prescribed range. 


# Repeat the following until the system percolates:
# Choose a site (row i, column j) uniformly at random among all blocked sites.
# Open the site (row i, column j).
# The fraction of sites that are opened when the system percolates provides an estimate of the percolation threshold.
class PercoloationStats

  #perform trials independent experiments on an n-by-n grid
  def initialize(size, trials)
  end

  #sample mean of percolation threshold
  def mean
  end

  #sample standard deviation of percolation threshold
  def stddev
  end

  #low  endpoint of 95% confidence interval
  def confidenceLo
  end

  #high endpoint of 95% confidence interval
  def confidenceHi
  end
end

percolationStats = PercolationStats.new(200,100)
# mean                    = 0.5929934999999997
# stddev                  = 0.00876990421552567
# 95% confidence interval = 0.5912745987737567, 0.5947124012262428

percolationStats = PercolationStats.new(200,100)
# mean                    = 0.592877
# stddev                  = 0.009990523717073799
# 95% confidence interval = 0.5909188573514536, 0.5948351426485464

percolationStats = PercolationStats.new(2,1000)
# mean                    = 0.666925
# stddev                  = 0.11776536521033558
# 95% confidence interval = 0.6646167988418774, 0.6692332011581226

percolationStats = PercolationStats.new(2,1000)
# mean                    = 0.6669475
# stddev                  = 0.11775205263262094
# 95% confidence interval = 0.666217665216461, 0.6676773347835391


