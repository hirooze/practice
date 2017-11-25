puts "test"
p ARGV[0]
p ENV["PATH"]
a = 1
a = if 1 || 0 then ; p "ture" ; end
v1 = %w(hoge foo bar)
p v1
p v1.join()
p v1.join("_")
v2 = Array.new(5, "a")
p v2
p v2.length