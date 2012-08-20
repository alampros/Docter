#!/usr/bin/env ruby
#  @author Aaron Lampros
#
#  Github-flavored markdown to HTML, in a command-line util.
#
#  $ cat README.md | ./github-flavored-markdown.rb
#
#  Notes:
#  You will need to install Pygments for syntax coloring
#  ```bash
#    $ sudo easy_install pygments
#  ```
#
#  Install the gems `redcarpet` and `Pygments`
#
#
require 'rubygems'
require 'redcarpet'
require 'pathname'
require 'pygments.rb'

class HTMLwithPygments < Redcarpet::Render::XHTML
	def doc_header()
		ghf_css_path = File.join(
			File.dirname(Pathname.new(__FILE__).realpath),
			'github-flavored-marked.css');

		'<style>' + File.read(ghf_css_path) + '</style><div class="md"><article>'
	end
	def doc_footer
		'</article></div>'
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
		:tables => true,
		:xhtml => true)
	markdown.render(text)
end

puts fromMarkdown(STDIN.read)
