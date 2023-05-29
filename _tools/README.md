# Tools


## mdtags.sh

This [script](./mdtags.sh) reads the tags from the yaml header of a markdown file and generates a tagsfile in the current directory.


### Usage

- navigate to the folder where you want to generate the tags file
- run the script with Space+t
- open the Telescope Tags preview with Space+tt

### Config

mdtags function

```neovim

local M = {}

function M.mdtags()
    --local path = vim.api.nvim_buf_get_name(0):match("^(.*)/%w+.%w+$")
    local path = vim.fn.expand('%:p:h')
    local script = "$HOME/WORK/ZKN/_tools/mdtags.sh"
    --    vim.fn.jobstart(command)
    vim.fn.system(script .. " " .. path)
end
return M
```

nvim keymap

```neovim
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>t", "<cmd>lua require('fn.utils').mdtags()<CR>")
vim.keymap.set('n', '<leader>tt', builtin.tags, {})
```

## taking fleeting notes

To capture a new fleeting note, nvim is started in an floating window.

[Script source](https://github.com/CalinLeafshade/dots/blob/master/bin/bin/notetaker)

[Explanation on youtube](https://www.youtube.com/watch?v=zB_3FIGRWRU)

## Usage

- the CAPS key is configured as $MOD3.
- CAPS+Space executes the [script](./notetaking.sh) in a new alacritty instance

i3 config

```
for_window [ title="notetaking" ] floating enable,resize set 1400px 1000px,move position center;
bindsym $mod3+space exec --no-startup-id /usr/bin/alacritty -T notetaking -e "$HOME/WORK/ZKN/_tools/notetaking.sh"
```
