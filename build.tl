local libpage = require 'libpage'
local home = require 'home'

-- home:
libpage.save_page('Andre-LA', home, 'index.html')

-- blog:
local blogpost_sources = {
  require 'blog.2022.00-pt-ola-mundo'
}

for _, blogpost_src in ipairs(blogpost_sources) do
  libpage.save_page(blogpost_src.title, blogpost_src.element_tree, 'blog/2022/00-pt-ola-mundo.html')
end

