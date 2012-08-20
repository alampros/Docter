# Flavored
## That restaurant GitHub flavor for [Marked](http://markedapp.com/)

**Flavored** is the [GitHub Flavored Markdown](http://github.github.com/github-flavored-markdown/) processor for **Marked** that supports the following syntax extensions:

### Fenced code blocks with syntax highlighting

```ruby
require 'redcarpet'
markdown = Redcarpet.new("Hello World!")
puts markdown.to_html
```

### Tables

| Dividend | Divisor | Quotient |
| -------- | ------- | -------- |
| 1024     | 16      | 64       |
| 3330     | 5       | 666      |
| *i* - 1  | *i* + 1 | *i*      |
| *i* + 1  | *i* - 1 | -*i*     |

### Other features

* URL autolinking,
* newlines in paragraphs,
* `multiple_underscores_in_words`,
* `~~strikethrough~~` *and more.*

## Installation

### Automatic installation

To install Flavored, open Terminal and type:

```bash
curl -L https://raw.github.com/porada/Flavored/marked/install.sh | sh
```

The script will automatically install all required components, download Flavored’s files and update Marked’s preferences.

To upgrade, simply execute the line again.

### Manual installation

1. Install [Pygments](http://pygments.org/):

        sudo easy_install pygments
        sudo ln -s /usr/local/bin/pygmentize /usr/bin

2. Install `redcarpet` and `pygments.rb` [gems](http://rubygems.org/):

        sudo gem install redcarpet
        sudo gem install pygments.rb

3. [Download](https://github.com/porada/Flavored/zipball/marked) or clone Flavored’s repository:

        git clone https://github.com/porada/Flavored.git

4. Make `github-flavored-marked.rb` executable:

        chmod a+x github-flavored-marked.rb

5. Set the **full path** to `github-flavored-marked.rb` in *Marked › Preferences › Behavior › Custom Processor*.

6. Make sure `github-flavored-marked.css` is in located in the same directory as `github-flavored-marked.rb`.

    **Don’t add** the stylesheet in *Marked › Preferences › Style*, because the executable already links to it.

## Credits

Thanks to [Aaron Lampros](https://github.com/alampros), the creator of Flavored’s code base, [Docter](https://github.com/alampros/Docter).