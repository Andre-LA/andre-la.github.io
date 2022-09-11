local Element = require 'tlpages.element'
local quick = require 'tlpages.quick'

local libpage = {}

local DOCTYPE <const> = quick '!DOCTYPE html' (nil)

function libpage.save_page(title: string, element_tree: Element, filepath: string)
  assert(title ~= nil, "libpage.save_page: argument #1 'title' is nil!")
  assert(element_tree ~= nil, "libpage.save_page: argument #2 'element_tree' is nil!")
  assert(filepath ~= nil, "libpage.save_page: argument #3 'filepath' is nil!")

  local page = (
    quick 'html' {
      quick 'head' {
        quick 'meta' (nil, {charset = 'utf-8'}),
        -- quick 'meta' (nil, {name="viewport", content="width=device-width, initial-scale=1"}),
        quick 'title' (title),
        quick 'link' (nil, {rel="icon", href="favicon.ico", type="image/x-icon"}),
        quick 'link' (nil, {rel="stylesheet", href="/style.css"}),
        quick 'link' (nil, {rel="stylesheet", href="/assets/fonts/zilla_slab/zilla-slab.css"}),
        quick 'link' (nil, {rel="stylesheet", href="/assets/fonts/iosevka_slab/iosevka-slab.css"}),
      },

      quick 'body' {
        element_tree
      }
    }
  )

  local html = table.concat({ DOCTYPE:render(), page:render() }, '\n')

  filepath = 'docs/'..filepath

  local output = assert(io.open(filepath, 'w'), "Couldn't open output file: " .. filepath)
  output:write(html..'\n')
        :close()
end

return libpage
