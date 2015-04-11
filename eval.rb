def remove_single_el_arrays(s_expr)
  return s_expr unless s_expr.class == Array

  return remove_single_el_arrays(s_expr[0]) if s_expr.length == 1
  
  return s_expr.map { |el| remove_single_el_arrays(el) }
end

def my_eval(input, env)
  s_expr = remove_single_el_arrays(Marshal.load(Marshal.dump(input)))

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