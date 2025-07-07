# 🧩 CodeCompanion Lualine

A simple [lualine](https://github.com/nvim-lualine/lualine.nvim) component for
[CodeCompanion](https://github.com/olimorris/codecompanion.nvim), providing a
status indicator with the number of active CodeCompanion requests.

TODO: add video demo

## ⚡️ Lazy Loading Friendly

This component is fully lazy-loading aware. The component will not load or
display unless CodeCompanion has already been loaded for some other reason. This
means you can safely include it in your lualine setup without interfering with
your plugin manager's lazy loading optimizations.

## ✨ Features

- Displays the number of active CodeCompanion requests.
- Shows a spinner while requests are active, and a checkmark (✓) when idle.
- Includes an icon and can be customized.

## 🚀 Installation

With [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
return {
    "franco-ruggeri/codecompanion-lualine.nvim",
}

## ⚙️ Usage

After installing, use `"codecompanion"` in your lualine sections:

```lua
sections = {
    lualine_x = {
        -- other components
        "codecompanion"
    },
},
```

## 🛠️ Customization

The default options are:

```lua
local default_options = {
 icon = " ",
 spinner_symbols = {
  "⠋",
  "⠙",
  "⠹",
  "⠸",
  "⠼",
  "⠴",
  "⠦",
  "⠧",
  "⠇",
  "⠏",
 },
 done_symbol = "✓",
}
```

You can change them as follows:

```lua
require('lualine').setup {
  sections = {
    lualine_c = {
      {
        "codecompanion",
        icon = " ",
        spinner_symbols = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
        done_symbol = "✓",
      },
    },
  },
}
```
