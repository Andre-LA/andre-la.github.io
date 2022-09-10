local Element = require 'tlpages.element'
local quick = require 'tlpages.quick'

local record Blogpost
  title: string
  element_tree: Element
end

local record libblog
  record Date
    enum DayInWeek
      "Sunday"
      "Monday"
      "Tuesday"
      "Wednesday"
      "Thursday"
      "Friday"
      "Saturday"
    end

    enum Month
      'January'
      'February'
      'March'
      'April'
      'May'
      'June'
      'July'
      'August'
      'September'
      'October'
      'November'
      'December'
    end

    day_in_week: DayInWeek
    day: integer
    month: Month
    year: integer
    hour: integer
    minute: integer

    new: function(day_in_week: DayInWeek, day: integer, month: Month, year: integer, hour: integer, minute: integer)
    to_element: function(self: Date, lang: string)
  end
end

local diw_pt: {libblog.Date.DayInWeek:string} = {
  ["Sunday"]    = "Domingo",
  ["Monday"]    = "Segunda-feira",
  ["Tuesday"]   = "Terça-feira",
  ["Wednesday"] = "Quarta-feira",
  ["Thursday"]  = "Quinta-feira",
  ["Friday"]    = "Sexta-feira",
  ["Saturday"]  = "Sábado",
}

local month_pt: {libblog.Date.Month:string} = {
  ['January'] = 'Janeiro',
  ['February'] = 'Fevereiro',
  ['March'] = 'Março',
  ['April'] = 'Abril',
  ['May'] = 'Maio',
  ['June'] = 'Junho',
  ['July'] = 'Julho',
  ['August'] = 'Agosto',
  ['September'] = 'Setembro',
  ['October'] = 'Outubro',
  ['November'] = 'Novembro',
  ['December'] = 'Dezembro',
}

local licences: {string:Element} = {
  ['cc-by-nc 4.0'] = quick 'div' [[<a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/">Creative Commons Attribution-NonCommercial 4.0 International License</a>.]]
}

function libblog.Date.new(
  day_in_week: libblog.Date.DayInWeek,
  day: integer,
  month: libblog.Date.Month,
  year: integer,
  hour: integer,
  minute: integer
): libblog.Date
  local date: libblog.Date = {
    day_in_week = day_in_week,
    day    = day,
    month  = month,
    year   = year,
    hour   = hour,
    minute = minute,
  }
  return setmetatable(date, { __index = libblog.Date })
end

function libblog.Date:to_element(lang: string): Element
  local function dd_fmt(n: integer): string
    local dec = n // 10
    return string.format('%d%d', dec, n - dec*10)
  end

  local day_in_week: string = self.day_in_week
  local month: string = self.month
  local fmt = 'Published in: %s, %d de %s, %d - %s:%s'

  if lang == 'pt' then
    day_in_week = diw_pt[self.day_in_week]
    month = month_pt[self.month]
    fmt = fmt:gsub('Published in', 'Publicado em')
  end

  local full_date = string.format(fmt, day_in_week, self.day, month, self.year, dd_fmt(self.hour), dd_fmt(self.minute))
  return quick 'div' (full_date)
end

function libblog.author(lang: string, author: string): Element
  if lang == 'pt' then
    return quick 'p' ("Escrito por: " .. author)
  else
    return quick 'p' ("Written by: " .. author)
  end
end

function libblog.blogpost_page(title: string, article: Element, date: libblog.Date, license: string): Blogpost
  local license_el = licences[license]
  assert(license_el ~= nil, 'libblog.blogpost_page: Unknown license: ' .. license)

  return {
    title = title,

    element_tree = quick 'article' {
      quick 'a' ([[Return]], {href = "/index.html"}),
      quick 'h1' (title),
      date:to_element('pt'),
      article,
      libblog.author('pt', 'André L. Alvares'),
      license_el,
    },
  }
end

return libblog
