local quick = require 'tlpages.quick'

local article = require 'website.blog.2022.00-pt-ola-mundo'

local DOCTYPE <const> = quick '!DOCTYPE html' (nil)

local page = (
  quick 'html' {
    quick 'head' {
      quick 'meta' (nil, {charset = 'utf-8'}),
      quick 'title' 'My Page',
    },

    quick 'body' {
      article
    }
  }
)

local html = table.concat({ DOCTYPE:render(), page:render() }, '\n')

io.open('docs/index.html', 'w')
  :write(html)
  :close()
