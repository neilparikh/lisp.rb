def my_eval(input, env)
  s_expr = Marshal.load(Marshal.dump(input))

  if s_expr.class == Array
    func = my_eval(s_expr.shift, env)

    if func.eval_args?
      func.call(s_expr.map { |el| my_eval(el, env) }, env)
    else
      func.call(s_expr, env)
    end
  else
    env.keys.include?(s_expr) ? env[s_expr] : s_expr
  end
end
