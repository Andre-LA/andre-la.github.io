-- tlpages
local Element = require 'tlpages.element'
local quick = require 'tlpages.quick'

local e = {
  br = quick 'br' (nil),

  a = function(content: string, href: string): Element
    return quick 'a' (content, { href = href })
  end,
}


local my_games_table = quick 'div' {
  quick 'table' {
    quick 'tr' {
      quick 'th' [[Name]],
      quick 'th' [[Description]],
      quick 'th' [[Tech]],
      quick 'th' [[Links]],
    },

    quick 'tr' {
      quick 'td' [[Octo Gravity]],
      quick 'td' [[Jump and run in an octagon full of obstacles and overcome your own records]],
      quick 'td' { e.a([[Unity]], "https://unity.com/") },
      quick 'td' { e.a([[Itch.io]], "https://origamisword.itch.io/octo-gravity"), e.br, e.a([[Steam]], "https://store.steampowered.com/app/865800/Octo_Gravity/") },
    },

    quick 'tr' {
      quick 'td' { e.a([[On Rails]], "https://github.com/Andre-LA/GGJ-BaixadaSantista-2021") },
      quick 'td' [[Be lost on subways, guided by your grandma's messages on your smartphone]],
      quick 'td' { e.a([[Unity]], "https://unity.com/") },
      quick 'td' { e.a([[Download]], "https://globalgamejam.org/2021/games/rails-1"), e.br, e.a([[Video]], "https://youtu.be/rV-rSyMBgLQ"), e.br, e.a([[GGJ-2021 Jam]], "https://globalgamejam.org/2021/jam-sites/ggj-baixada-santista-usjtunimonte") },
    },

    quick 'tr' {
      quick 'td' { e.a([[Micro Quest]], "https://github.com/Andre-LA/micro-quest") },
      quick 'td' [["The Knight" was given the mission to eliminate all the slimes that are infesting the tower]],
      quick 'td' { e.a([[Nelua]], "https://nelua.io/"), e.br, e.a([[WASM-4]], "https://wasm4.org/") },
      quick 'td' { e.a([[Play]], "https://andre-la.itch.io/micro-quest"), e.br, e.a([[WASM-4 Jam]], "https://itch.io/jam/wasm4") },
    },

    quick 'tr' {
      quick 'td' { e.a([[Totally not Sumo]], "https://github.com/Andre-LA/totally-not-sumo") },
      quick 'td' [[Push your opponents out, while dealing with an controller duality]],
      quick 'td' { e.a([[Nelua]], "https://nelua.io/"), e.br, e.a([[WASM-4]], "https://wasm4.org/") },
      quick 'td' { e.a([[Play]], "https://origamisword.itch.io/totally-not-sumo"), e.br, e.a([[GGJ-2022 Jam]], "https://globalgamejam.org/2022/jam-sites/global-game-jam-2022-%E2%80%93-baixada-santista-unisantos") },
    },

    quick 'tr' {
      quick 'td' { e.a([[Castle Escape]], "https://github.com/Andre-LA/baixada-game-jam-game") },
      quick 'td' [[Help the princess to escape from castle]],
      quick 'td' { e.a([[Nelua]], "https://nelua.io/"), e.br, e.a([[Raylib]], "https://www.raylib.com/") },
      quick 'td' { e.a([[Play]], "https://andre-la.github.io/baixada-game-jam-game/index.html"), e.br, e.a([[Baixada Game Jam]], "https://itch.io/jam/baixada-gamejam") },
    },

    quick 'tr' {
      quick 'td' { e.a([[Nhóm Nhóm]], "https://github.com/unimonte-games/nhom-nhom") },
      quick 'td' [[Control a slime pirate waiter, serve slimes customers and deliver their respective orders]],
      quick 'td' { e.a([[Unity]], "https://unity.com/") },
      quick 'td' { e.a([[Download]], "https://andre-la.itch.io/nhom-nhom") },
    },

    quick 'tr' {
      quick 'td' { e.a([[Lunar Lander]], "https://github.com/nicolas-ft/LunarLander") },
      quick 'td' [[Lunar Lander clone]],
      quick 'td' { e.a([[Unity]], "https://unity.com/") },
      quick 'td' [[ -- ]],
    },

    quick 'tr' {
      quick 'td' { e.a([[Festa dos Duendes]], "https://github.com/unimonte-games/festa-dos-duendes") },
      quick 'td' [[Local multiplayer party game]],
      quick 'td' { e.a([[Unity]], "https://unity.com/") },
      quick 'td' [[ -- ]],
    },

    quick 'tr' {
      quick 'td' { e.a([[Space Pigs Revolution]], "https://github.com/unimonte-games/space-pigs-revolution") },
      quick 'td' [[Shoot'em up game]],
      quick 'td' { e.a([[Unity]], "https://unity.com/") },
      quick 'td' { e.a([[Play]], "https://unimonte-games.github.io/space-pigs-revolution/index.html") },
    },

    quick 'tr' {
      quick 'td' { e.a([[Akangatu (digital version)]], "https://github.com/unimonte-games/jogo-akangatu-digital") },
      quick 'td' [[Memory game]],
      quick 'td' { e.a([[Unity]], "https://unity.com/") },
      quick 'td' [[ -- ]],
    },

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
