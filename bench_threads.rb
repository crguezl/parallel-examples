require 'benchmark'
require 'parallel'
 
num_threads = ARGV.shift || 8
arr_size = ARGV.shift || 1000000
array = (1..arr_size).map { rand }
 
puts "size = #{arr_size}"
puts "num threads = #{num_threads}"
Benchmark.bmbm do |x|
  x.report("seqs")  { result = array.sort }
  x.report("sort")  { resultp = Parallel.map([0], :in_threads=>num_threads) { array.sort }  }
end

