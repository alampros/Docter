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

…

## Credits

Thanks to [Aaron Lampros](https://github.com/alampros), the creator of Flavored’s code base, [Docter](https://github.com/alampros/Docter).