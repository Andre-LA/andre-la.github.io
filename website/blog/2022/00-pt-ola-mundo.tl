local Element = require 'tlpages.element'
local quick = require 'tlpages.quick'

local function date(day_in_week: string, day: integer, month: string, year: integer, hour: integer, minute: integer): Element
  local function dd_fmt(n: integer): string
    local dec = n // 10
    return string.format('%d%d', dec, n - dec*10)
  end

  local full_date = string.format('Publicado em: %s, %d de %s, %d - %s:%s', day_in_week, day, month, year, dd_fmt(hour), dd_fmt(minute))
  return quick 'div' (full_date, { id = 'publish-date' })
end

return quick 'div' (
  {
    date('Terça', 23, 'Agosto', 2022, 1, 27),
    quick 'h1' 'Olá mundo!',
    quick 'strong' [[Sejam bem-vindes ao meu humilde blog, não repara na bagunça... Ou neste caso de sua total ausência.]],
  },
  {
    id = 'post-content'
  }
)

