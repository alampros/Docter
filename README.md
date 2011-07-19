#Docter

Get that restaurant github flavor at home in your editor.

![Screenshot][ss]

Uses github's own [redcarpet][redcarpet] library to provide accurate markdown previews in your local editor. This screenshot shows [Marked][marked] using `docter` as the markdown processor.

##[GitHub Flavored Markdown][ghfm] Extensions Supported:

* Fenced codeblocks

	```javascript
	process.stdin.on('data', function (chunk) {
		gfm.stdin.write(chunk);
		gfm.stdin.end();
	});
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

* [NodeJS][node]
* [NPM][npm]
* [Ruby][ruby]
* [Rubygems][gems]
* Various gems

	```bash
	$ gem install redcarpet albino nokogiri
	```
* [Pygments][pygments]

	```bash
	$ sudo easy_install pygments
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

1. In Marked's preferences, set the custom styles to the included `ghf_marked.css`  
	![Screenshot][ss_css]
2. Set the markdown processor to the linked executable:  
	![Screenshot][ss_marked]










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