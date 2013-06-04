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
require 'rexml/document'

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
  def header(title, level)
    @headers ||= []

    title_elements = REXML::Document.new(title)
    flattened_title = title_elements.inject('') do |flattened, element|
      flattened +=  if element.respond_to?(:text)
                      element.text
                    else
                      element.to_s
                    end
    end
    permalink = flattened_title.downcase.gsub(/[^a-z\s]/, '').gsub(/\W+/, "-")
    
    # for extra credit: implement this as its own method
    if @headers.include?(permalink)
      permalink += "_1"
       # my brain hurts
      loop do
        break if !@headers.include?(permalink)
        # generate titles like foo-bar_1, foo-bar_2
        permalink.gsub!(/\_(\d+)$/, "_#{$1.to_i + 1}")
      end
    end
    @headers << permalink
    %(\n<h#{level}><a name="#{permalink}" class="anchor" href="##{permalink}"><span class="anchor-icon"></span></a>#{title}</h#{level}>\n)
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
