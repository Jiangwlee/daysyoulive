#!/usr/bin/env ruby

require 'date'
require 'optparse'

options = {}

opt_parser = OptionParser.new do |opts|
  opts.banner = "
    This is a free software, and you are welcomed
    to redistribute it under certain conditions (GPLv3) 

    Usage : ./daysyoulive [options]
  "

  # option arguments, multi-line description and cast the argument to Date
  opts.on('-bbirthday', '--birthday=birthday', 'The birthday of you!') do |date|
    options[:birthday] = date
  end  

  opts.on('-h', '--help', 'Show this message') do
    puts opts.help
    exit
  end
end

begin
  opt_parser.parse!
rescue OptionParser::MissingArgument 
  puts "    *** Excpetion : #{$!} ***"
  puts opt_parser.help
  exit
end

birthday = Date.parse('2014-01-26')
begin
  if not options.has_key? :birthday
    puts "Use the default dirthday : #{birthday}"
  else
    birthday = Date.parse(options[:birthday])
  end

  date_duration = Date.today - birthday
  puts "Birthday : #{birthday}! You have been on the earth for #{date_duration.to_i} days!"
rescue Exception => exception
  puts exception
end
