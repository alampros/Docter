#!/usr/bin/env ruby
require 'redcarpet'

ARGV.each do|a|
  str = File.read(a)
  markdown = Redcarpet.new(str,:fenced_code,:generate_toc,:hard_wrap,:no_intraemphasis,:strikethrough,:gh_blockcode,:autolink)
  puts markdown.to_html
end