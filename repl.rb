require_relative 'main'

while true 
  print "risp> " # Example expr: (+ 2 (+ 4 2))
  expr = gets
  break if expr == ",\n" or expr == nil

  s_expr = SXP.read(expr.strip)
  output = my_eval(s_expr, $env)
  puts output if !output.nil?
end
