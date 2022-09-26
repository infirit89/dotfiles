vim.cmd([[
	so ~/AppData/Local/nvim/setup.vim
]])

local on_attach = function()
    vim.api.nvim_command("iunmap <C-h>")
end

require("toggleterm").setup
{
    open_mapping = [[<c-t>]],
    start_in_insert = true,
    close_on_exit = true,
    shell = vim.o.shell
}

require("lualine").setup
{
    options = 
    {
        icons_enabled = true,
        theme = "jellybeans",
        --component_separators = { left = '', right = ''},
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = ''},
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
    tabline = {},
    extensions = {}
}

require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "cpp", "lua" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        --additional_vim_regex_highlighting = true,
    },
    --[[rainbow = ]]
    --[[{]]
        --[[enable = true,]]
        --[[extended_mode = true,]]
        --[[max_file_lines = nil]]
    --[[}]]
}

--on_attach()
function file_exists(name)
    local f = io.open(name, "r")
    if f~=nil then io.close(f) return true else return false end
end

function load_project_config()
    if file_exists(".vim/local.vim") then
        vim.cmd([[
            so .vim/local.vim
        ]])
    end
end

load_project_config()

