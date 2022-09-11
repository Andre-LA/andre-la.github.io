-- tlpages
local Element = require 'tlpages.element'
local quick = require 'tlpages.quick'

local e = {
  br = quick 'br' (nil),

  a = function(content: string, href: string): Element
    return quick 'a' (content, { href = href })
  end,
}

local tech_anchors: {string : Element} = {
  ["Unity"]  = e.a([[Unity]], "https://unity.com/"),
  ["Nelua"]  = e.a([[Nelua]], "https://nelua.io/"),
  ["WASM-4"] = e.a([[WASM-4]], "https://wasm4.org/"),
  ["Raylib"] = e.a([[Raylib]], "https://www.raylib.com/"),
}

local function game_element(name: string, src_code: string, description: string, techs: {string}, links: { {string, string} }): Element
  local link_td: Element | string;
  local link_elements: {Element} = {}
  local tech_elements: {Element} = {};

  if links then
    link_elements = {}
    for _, link in ipairs(links) do
      table.insert(link_elements, e.a(link[1], link[2]))
      table.insert(link_elements, e.br)
    end
    table.remove(link_elements)

    link_td = quick 'td' {
      table.unpack(link_elements)
    }
  else
    link_td = quick 'td' [[ --- ]]
  end

  for _, tech in ipairs(techs) do
    table.insert(tech_elements, (assert(tech_anchors[tech], "Unknown tech: " .. tech)) )
  end

  return quick 'tr' {
    ( not src_code and quick 'td' (name) or quick 'td' { e.a(name, src_code) } ),
    quick 'td' (description),
    quick 'td' { table.unpack(tech_elements) },
    link_td
  }
end

local my_games_table = quick 'div' {
  quick 'table' {
    quick 'tr' {
      quick 'th' [[Name]],
      quick 'th' [[Description]],
      quick 'th' [[Tech]],
      quick 'th' [[Links]],
    },

    game_element(
      [[Octo Gravity]],
      nil,
      [[Jump and run in an octagon full of obstacles and overcome your own records]],
      { [[Unity]] },
      {
        { [[Itch.io]], "https://origamisword.itch.io/octo-gravity" } ,
        { [[Steam]], "https://store.steampowered.com/app/865800/Octo_Gravity/" } ,
      }
    ),

    game_element(
      [[On Rails]],
      "https://github.com/Andre-LA/GGJ-BaixadaSantista-2021",
      [[Be lost on subways, guided by your grandma's messages on your smartphone]],
      { [[Unity]] },
      {
        { [[Download]], "https://globalgamejam.org/2021/games/rails-1" },
        { [[Video]], "https://youtu.be/rV-rSyMBgLQ" },
        { [[GGJ-2021 Jam]], "https://globalgamejam.org/2021/jam-sites/ggj-baixada-santista-usjtunimonte" },
      }
    ),

    game_element(
      [[Micro Quest]],
      "https://github.com/Andre-LA/micro-quest",
      [["The Knight" was given the mission to eliminate all the slimes that are infesting the tower]],
      { [[Nelua]], [[WASM-4]] },
      {
        { [[Play]], "https://andre-la.itch.io/micro-quest" },
        { [[WASM-4 Jam]], "https://itch.io/jam/wasm4" },
      }
    ),

    game_element(
      [[Totally not Sumo]],
      "https://github.com/Andre-LA/totally-not-sumo",
      [[Push your opponents out, while dealing with an controller duality]],
      { [[Nelua]], [[WASM-4]] },
      {
        { [[Play]], "https://origamisword.itch.io/totally-not-sumo" },
        { [[GGJ-2022 Jam]], "https://globalgamejam.org/2022/jam-sites/global-game-jam-2022-%E2%80%93-baixada-santista-unisantos" },
      }
    ),

    game_element(
      [[Castle Escape]],
      "https://github.com/Andre-LA/baixada-game-jam-game",
      [[Help the princess to escape from castle]],
      { [[Nelua]], [[Raylib]] },
      {
        { [[Play]], "https://andre-la.github.io/baixada-game-jam-game/index.html" },
        { [[Baixada Game Jam]], "https://itch.io/jam/baixada-gamejam" },
      }
    ),

    game_element(
      [[Nhóm Nhóm]],
      "https://github.com/unimonte-games/nhom-nhom",
      [[Control a slime pirate waiter, serve slimes customers and deliver their respective orders]],
      { [[Unity]] },
      {
        { [[Download]], "https://andre-la.itch.io/nhom-nhom" },
      }
    ),

    game_element(
      [[Lunar Lander]],
      "https://github.com/nicolas-ft/LunarLander",
      [[Lunar Lander clone]],
      { [[Unity]] },
      nil
    ),

    game_element(
      [[Festa dos Duendes]],
      "https://github.com/unimonte-games/festa-dos-duendes",
      [[Local multiplayer party game]],
      { [[Unity]] },
      nil
    ),

    game_element(
      [[Space Pigs Revolution]],
      "https://github.com/unimonte-games/space-pigs-revolution",
      [[Shoot'em up game]],
      { [[Unity]] },
      {
        { [[Play]], "https://unimonte-games.github.io/space-pigs-revolution/index.html" },
      }
    ),

    game_element(
      [[Akangatu (digital version)]],
      "https://github.com/unimonte-games/jogo-akangatu-digital",
      [[Memory game]],
      { [[Unity]] },
      nil
    ),

    quick 'tr' {
      quick 'td' ({ e.a([[All Games]], "https://github.com/stars/Andre-LA/lists/all-my-games") }, { colspan=4 })
    },
  }
}

local my_libraries_table = quick 'table' {
  quick 'tr' {
    quick 'th' [[Name and Source code]],
    quick 'th' [[Description]],
    quick 'th' [[Status]],
  },

  quick 'tr' {
    quick 'td' { e.a([[Nene]], "https://github.com/Andre-LA/nene") },
    quick 'td' [[Game, development library for simple 2D games.]],
    quick 'td' [[Active]],
  },

  quick 'tr' {
    quick 'td' { e.a([[Rotor]], "https://github.com/Andre-LA/rotor-nelua") },
    quick 'td' [[Entity,-component-system library for Nelua, focused in simplicity.]],
    quick 'td' [[Active]],
  },

  quick 'tr' {
    quick 'td' { e.a([[Irene]], "https://github.com/andre-la/irene") },
    quick 'td' [[Personal, game engine made in top of nene and rotor.]],
    quick 'td' [[Active]],
  },

  quick 'tr' {
    quick 'td' { e.a([[NProf]], "https://github.com/Andre-LA/nprof") },
    quick 'td' [[Basic, Raylib profiler in Nelua, useful to discover what block of code is consuming more time to run.]],
    quick 'td' [[Paused]],
  },

  quick 'tr' {
    quick 'td' { e.a([[Raylib-nelua]], "https://github.com/Andre-LA/raylib-nelua") },
    quick 'td' [[Raylib, binding and wrapper for Nelua language, uses LPEG C parser to generate bindings automatically, wrapping is also automated.]],
    quick 'td' [[Paused]],
  },
}

return quick 'article' {
  quick 'h1' [[Hi! I'm Andre-LA]],
  quick 'p' [[I'm a game developer from Brazil 🇧🇷! Welcome to my website!]],

  quick 'h2' [[My Games:]],
  my_games_table,

  quick 'h2' [[Libraries:]],
  my_libraries_table,

  quick 'h2' [[Blog:]],
  quick 'ul' {
    quick 'li' { quick 'a' ([[Olá Mundo!]], { href = "blog/2022/00-pt-ola-mundo.html"}) }
  },

  quick 'h2' [[Also present at:]],
  quick 'ul' {
    quick 'li' { quick 'a' ([[Github]], { href = "https://github.com/Andre-LA/"}) },
    quick 'li' { quick 'a' ([[Itch.io]], { href = "https://andre-la.itch.io/"}) },
    quick 'li' { quick 'a' ([[Gamedev.place (mastodon)]], { href = "https://mastodon.gamedev.place/@Andre_LA"}) },
    quick 'li' { quick 'a' ([[Twitter]], { href = "https://twitter.com/andre_la_devlog"}) },
  },
}
