# START Primitives
# TODO:
# - lambda
# - cond
# - define for functions (probably linked to lambda)
# - lambda
# - and, or
# - let
# - cons, car, cdr etc.

class Proc
  def eval_args?
    true
  end
end

class Lamb
  def initialize(args, body)
    @body = body
    @args = args
  end

  def call(args, env)
    my_eval(@body, env)
  end
end

$lambda = lambda { |args, env| }

$add    = lambda { |args, env| args.reduce(:+) }

$sub    = lambda { |args, env| args.reduce(:-) }

$mul    = lambda { |args, env| args.reduce(:*) }

$div    = lambda { |args, env| args.reduce(:/) }

$define = lambda { |args, env| env[args[0].to_sym] = args[1]; nil }

$equal  = lambda { |args, env| args[0] == args[1] }

$gt     = lambda { |args, env| args[0] >  args[1] }

$lt     = lambda { |args, env| args[0] <  args[1] }

$if     = lambda { |args, env|
	my_eval(my_eval(args[0], env) ? args[1] : args[2], env)
}

def $if.eval_args?
 false
end
# END Primitives