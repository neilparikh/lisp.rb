require_relative 'eval'
require_relative 'primitives'
require 'sxp' # https://github.com/bendiken/sxp-ruby

env = {
  :+ => $add,
  :- => $sub,
  :* => $mul,
  :/ => $div,
  :define => $define,
  :'=' => $equal,
  :'>' => $gt,
  :'<' => $lt,
  :if => $if,
  :'#t' => true,
  :'#f' => false,
}

while true 
  print "risp> " # Example expr: (+ 2 (+ 4 2))
  expr = gets
  break if expr == ",\n" or expr == nil

  s_expr = SXP.read(expr.strip)
  output = my_eval(s_expr, env)
  puts output if !output.nil?
end