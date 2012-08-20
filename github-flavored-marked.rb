#!/usr/bin/env ruby

require 'rubygems'
require 'redcarpet'
require 'pathname'
require 'pygments.rb'

class HTMLwithPygments < Redcarpet::Render::HTML
	def doc_header()
		"<div class=\"md\">\n<article>\n<!-- -->\n"
	end
	def doc_footer
		stylesheet = File.read(File.join(
			File.dirname(Pathname.new(__FILE__).realpath),
			'github-flavored-marked.css'));

		"\n<!-- -->\n</article>\n</div>\n<style>\n\n" + stylesheet + "\n\n</style>"
	end
	def block_code(code, language)
		Pygments.highlight(code, :lexer => language, :options => {:encoding => 'utf-8'})
	end
end

def fromMarkdown(text)
	markdown = Redcarpet::Markdown.new(HTMLwithPygments,
		:fenced_code_blocks => true,
		:no_intra_emphasis => true,
		:autolink => true,
		:strikethrough => true,
		:lax_html_blocks => true,
		:superscript => true,
		:hard_wrap => true,
		:tables => true)
	markdown.render(text)
end

puts fromMarkdown(STDIN.read)
