#!/usr/bin/env ruby

require_relative 'main'

if ARGV.length == 0
  system("ruby repl.rb")
else
  program = File.read(ARGV[0])
  program.split("\n").each do |expr|
    my_eval(SXP.read(expr), $env)
  end
end
