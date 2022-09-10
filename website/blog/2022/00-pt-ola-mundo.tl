-- tlpages
local quick = require 'tlpages.quick'

-- libblog
local libblog = require 'blog.libblog'

-- post
local article = quick 'article' {
  quick 'p' [[Sejam bem-vindes ao meu humilde blog, não repara na bagunça... Ou neste caso de sua total ausência.]],
  quick 'p' [[Note: I'm still building this website]],
}

return libblog.blogpost_page('Olá Mundo!', article, libblog.Date.new('Tuesday', 23, "August", 2022, 1, 34 ), 'cc-by-nc 4.0')

