require 'benchmark'
require_relative 'quick_sort.rb'
require_relative 'merge_sort.rb'
require_relative 'insertion_sort.rb'

array = (0..500_000).map { |m| rand(2_000_000) }
array_duplicates = (0..500_000).map { |m| 77 }

Benchmark.bmbm do |x|
  x.report(:q_sort) { quick_sort(array) }
  x.report(:m_sort) { merge_sort(array) }
  x.report(:q_sort_dup) { quick_sort(array_duplicates) }
  x.report(:m_sort_dup) { merge_sort(array_duplicates) }
end