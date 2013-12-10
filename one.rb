require 'parallel'
include Math

num_threads = (ARGV.shift || 8).to_i
last_thread = num_threads-1

factor = 1 << 22
arr_size = ARGV.shift || factor
last_arr = arr_size-1

array = (1..arr_size).map { rand() }
   
puts "size = #{arr_size}"
puts "num threads = #{num_threads}"
#p array

def heavy(x)
  10.times do
    cos(sin(sin(x)))
  end
  cos(sin(sin(x)))
end

before = Time.new
aux = (0..last_thread).map { [] }
for i in (0..last_arr) 
  x = array[i]
  #puts "i=#{i} x=#{x}"
  aux[i%num_threads] <<  x
  #p aux
end
after = Time.new

puts "before partition = #{before.to_f} after partition = #{after.to_f}, diff = #{after-before}"

#p aux

before = Time.new
results = Parallel.map(0..last_thread, :in_threads=>num_threads) do |i|
  aux[i].inject(0) { |s, x| s+heavy(x) }
end
after = Time.new

puts "before sum = #{before.to_f} after sum = #{after.to_f}, diff = #{after-before}"

before = Time.new
sol = results.inject(0) { |s, x| s+x }
after = Time.new
puts "before reduction = #{before.to_f} after reduction = #{after.to_f}, diff = #{after-before}"

p sol
p results.length
p results[0].class
p results
