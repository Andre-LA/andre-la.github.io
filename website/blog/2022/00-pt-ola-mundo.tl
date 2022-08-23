local Element = require 'tlpages.element'
local quick = require 'tlpages.quick'

local function date(day_in_week: string, day: integer, month: string, year: integer, hour: integer, minute: integer): Element
  local function dd_fmt(n: integer): string
    local dec = n // 10
    return string.format('%d%d', dec, n - dec*10)
  end

  local full_date = string.format('Publicado em: %s, %d de %s, %d - %s:%s', day_in_week, day, month, year, dd_fmt(hour), dd_fmt(minute))
  return quick 'div' (full_date)
end

local function author(): Element
  return quick 'p' "Escrito por: André L. Alvares"
end

local function license(): Element
  return quick 'div' [[<a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/">Creative Commons Attribution-NonCommercial 4.0 International License</a>.]]
end

return quick 'div' (
  {
    date('Terça', 23, 'Agosto', 2022, 1, 34),
    quick 'h1' 'Olá mundo!',
    quick 'p' [[Sejam bem-vindes ao meu humilde blog, não repara na bagunça... Ou neste caso de sua total ausência.]],
    quick 'p' [[Note: I'm still building this website]],
    author(),
    license(),
  }
)

