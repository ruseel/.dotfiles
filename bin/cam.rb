#!/usr/bin/env ruby

STDOUT.write ARGV[0].split('_').map { |e| e[0].upcase + e[1..-1] }.join(' ')

