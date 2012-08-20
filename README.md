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
curl -#L https://raw.github.com/porada/Flavored/master/install.sh | sh
```

The script will automatically install all required components, download Flavored’s files and configure Marked.

To upgrade, simply execute the line again.

### Manual installation

1. Install [Pygments](http://pygments.org/):

        sudo easy_install pygments
        sudo ln -s /usr/local/bin/pygmentize /usr/bin

1. Install `redcarpet` and `pygments.rb` [gems](http://rubygems.org/):

        sudo gem install redcarpet
        sudo gem install pygments.rb

1. [Download](https://github.com/porada/Flavored/zipball/master) or clone Flavored’s repository:

        git clone https://github.com/porada/Flavored.git

1. Make `github-flavored-marked.rb` executable:

        chmod a+x github-flavored-marked.rb

1. Configure Marked:

    In the first line below, replace `$FULL_PATH` with the full path to `github-flavored-marked.rb`. No `~` expansion there.

        # Use custom processor
        defaults write com.brettterpstra.marky customMarkdownProcessor -string $FULL_PATH
        defaults write com.brettterpstra.marky useCustomMarkdownProcessor -int 1
        # Use Swiss stylesheet as the default
        defaults write com.brettterpstra.marky defaultPreviewStyle -int 0
        defaults write com.brettterpstra.marky showStylePicker -int 0

    Don’t add the stylesheet in *Preferences › Style*, because `github-flavored-marked.rb` already uses it.

1. Make sure `github-flavored-marked.css` is in located in the same directory as `github-flavored-marked.rb`.

## Credits

Thanks to [Aaron Lampros](https://github.com/alampros), the creator of Flavored’s code base, [Docter](https://github.com/alampros/Docter).