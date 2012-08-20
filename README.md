#Docter

Get that restaurant github flavor at home in your editor.

![Screenshot][ss]

Uses github's own [redcarpet][redcarpet] library to provide accurate markdown previews in your local editor. This screenshot shows [Marked][marked] using `docter` as the markdown processor.

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

### Requirements

* Various gems

	```bash
	$ gem install redcarpet pygments.rb
	```

## Using with [Marked.app][marked]

1. Set the markdown processor to either of the linked executables. If you don't plan on doing anything with the node wrapper, I would suggest using the straight ruby wrapper (`gfm`).

2. Optionally, add the `ghf_marked.css` (in this repo) to Marked's custom CSS list.

[ghfm]: http://github.github.com/github-flavored-markdown/ "Github Flavored Markdown"
[ss]: http://dl.dropbox.com/u/1127652/github/docter_syntax_screenshot.png  "Screenshot"
[redcarpet]: https://github.com/tanoku/redcarpet
[pygments]: http://pygments.org/
[marked]: http://markedapp.com/
[ruby]: http://www.ruby-lang.org/en/downloads/
[gems]: http://rubygems.org/
