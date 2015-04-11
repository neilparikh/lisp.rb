require_relative 'eval'
require_relative 'primitives'
require 'sxp' # https://github.com/bendiken/sxp-ruby

$env = {
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
  :lambda => $lambda,
  :"def-fun" => $def_fun,
  :print => $print,
  :"get-int" => $get_int,
  :and => $and,
  :or => $or
}
