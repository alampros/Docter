#Docter

Get that restaurant github flavor at home in your editor.

![Screenshot][ss]

Uses github's own [redcarpet][redcarpet] library to provide accurate markdown previews in your local editor. This screenshot shows [Marked][marked] using `docter` as the markdown processor.

##Changes

###2012-01-17

* Updated styles to match new GitHub styles
* Updated gfm wrapper for `Redcarpet` 2
* Removed `nokigiri` and `albino` dependencies
* Using [pygments.rb](https://github.com/tmm1/pygments.rb) wrapper instead

---

##[GitHub Flavored Markdown][ghfm] Extensions Supported:

* Fenced codeblocks

	```javascript
	var awesome = new BadassClass (param) {
		return "string"
	}
	```
* ~~Strikethru~~ support
* Syntax highlighting via [`pygments`][pygments]

	```ruby
	require 'redcarpet'
	def markdown(text)
	  options = [:fenced_code,:generate_toc,:hard_wrap,:no_intraemphasis,:strikethrough,:gh_blockcode,:autolink,:xhtml,:tables]
	  html = Redcarpet.new(text, *options).to_html 
	  syntax_highlighter(html)
	end
	```

* www.auto-linking.com
* table support

	| First Header  | Second Header |
	| ------------- | ------------- |
	| Content Cell  | Content Cell  |
	| Content Cell  | Content Cell  |



#Why NodeJS and not ruby?

I have future plans for this in a node project. And because it's my party.

#Requirements

Lots. Ungodly heaps of requirements.

* [NodeJS][node] and [NPM][npm] if you plan on using the node wrapper.
* [Ruby][ruby] & [Rubygems][gems]
* Various gems

	```bash
	$ gem install redcarpet pygments.rb
	```

#Usage

1. Clone this repo locally
2. `cd` to the repo
3. `[sudo] npm -g install`

This will install the package into your global `node_modules` dir (usually `/usr/local/lib/node_modules`). It will also symbolically link two executables into your path:

1. `docter`: the nodejs wrapper.
2. `gfm`: the ruby redcarpet/pygments wrapper.
	
Both of these executables take markdown input through STDIN and output formatted HTML on STDOUT.

##Using with [Marked.app][marked]

1. Set the markdown processor to either of the linked executables. If you don't plan on doing anything with the node wrapper, I would suggest using the straight ruby wrapper (`gfm`).
2. Optionally, add the `ghf_marked.css` (in this repo) to Marked's custom CSS list.


#Other styles

Uncomment the `doc_header()` function in `github-flavored-markdown.rb` and include any of the built-in styles from pygments. Replace `:style => 'vs'` with one of the styles in the comment block.

**Outputting the `emacs` style to the document header:**

```ruby
class HTMLwithPygments < Redcarpet::Render::XHTML
	def doc_header()
		'<style>' + Pygments.css('.highlight',:style => 'emacs') + '</style>'
	end
	def block_code(code, language)
		Pygments.highlight(code, :lexer => language, :options => {:encoding => 'utf-8'})
	end
end
```







[ghfm]: http://github.github.com/github-flavored-markdown/ "Github Flavored Markdown"
[ss]: http://dl.dropbox.com/u/1127652/github/docter_syntax_screenshot.png  "Screenshot"
[ss_marked]: http://dl.dropbox.com/u/1127652/github/docter_markedsetup.png "Screenshot"
[ss_css]: http://dl.dropbox.com/u/1127652/github/docter_customcss.png
[redcarpet]: https://github.com/tanoku/redcarpet
[pygments]: http://pygments.org/
[marked]: http://markedapp.com/
[node]: http://nodejs.org/
[npm]: http://npmjs.org/
[ruby]: http://www.ruby-lang.org/en/downloads/
[gems]: http://rubygems.org/
