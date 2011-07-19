#!/usr/bin/ruby
#  Github-flavored markdown to HTML, in a command-line util.
#
#  $ cat README.md | ./ghmarkdown.rb
#
#  Notes:
#
#  You will need to install Pygments for syntax coloring
#
#    $ sudo easy_install pygments
#
#  Install the gems redcarpet, albino, and nokogiri
#
#  To work with http://markedapp.com/ I also had to
#    $ sudo ln -s /usr/local/bin/pygmentize /usr/bin
#
require 'rubygems'
require 'redcarpet'
require 'albino'
require 'nokogiri'

def markdown(text)
  options = [:fenced_code,:generate_toc,:hard_wrap,:no_intraemphasis,:strikethrough,:gh_blockcode,:autolink]
  html = Redcarpet.new(text, *options).to_html 
  syntax_highlighter(html)
end

def syntax_highlighter(html)
  doc = Nokogiri::HTML(html)
  doc.search("//pre[@lang]").each do |pre|
    pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
  end
  doc.at_css("body").inner_html.to_s
end

# def syntax_highlighter(html)
#   doc = Nokogiri::HTML(html)
#   doc.search("//pre[@lang]").each do |pre|
#     pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
#   end
#   doc.to_s # doc.at_css("body").inner_html.to_s
# end

puts markdown(ARGF.read)