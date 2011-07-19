#Docter

Markdown with flavor....

Here's a hard line break  
and a block of javascript code

```javascript
var cli = require('cli').enable('version','status'),
	spawn = require('child_process').spawn,
	log = require('logging'),
	clc = require('cli-color');

cli.setApp('docter', "0.0.1");
```

#Second block

Here's some text with_some_inline bars.

Also, here's a block of ruby code.

```ruby
require 'redcarpet'

ARGV.each do|a|
  str = File.read(a)
  markdown = Redcarpet.new(str,:fenced_code,:generate_toc,:hard_wrap,:no_intraemphasis,:strikethrough,:gh_blockcode,:autolink)
  puts markdown.to_html
end
```

##Header2!

And some more **tests** for formatting.

##Strikethru!

Does this thing support ~~strikethru~~?

