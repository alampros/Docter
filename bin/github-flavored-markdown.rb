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
    ghf_css_path = File.join File.dirname(File.dirname Pathname.new(__FILE__).realpath),
                              'ghf_marked.css'
	#	puts Pygments.styles()
			# monokai
			# manni
			# perldoc
			# borland
			# colorful
			# default
			# murphy
			# vs
			# trac
			# tango
			# fruity
			# autumn
			# bw
			# emacs
			# vim
			# pastie
			# friendly
			# native
	# 	'<style>' + Pygments.css('.highlight',:style => 'vs') + '</style>'
    if UNSTYLED 
      '<div class="md"><article>'
    else
      '<style>' + File.read(ghf_css_path) + '</style><div class="md"><article>'
    end
	end
  def doc_footer
    '</article></div>'
  end
	def block_code(code, language)
		Pygments.highlight(code, :lexer => language, :options => {:encoding => 'utf-8'})
	end
end


def fromMarkdown(text)
	# options = [:fenced_code => true, :generate_toc => true, :hard_wrap => true, :no_intraemphasis => true, :strikethrough => true ,:gh_blockcode => true, :autolink => true, :xhtml => true, :tables => true]
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

UNSTYLED = (ARGV.first == '--unstyled')
puts fromMarkdown(STDIN.read)
