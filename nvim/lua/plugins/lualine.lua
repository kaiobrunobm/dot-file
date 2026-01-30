return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "gruvbox",
                    icons_enabled = false,
                    component_separators = "",
                    section_separators = "",
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = false,
                },
                sections = {
                    lualine_a = { { "mode", separator = { left = " " }, right_padding = 2 } },
                    lualine_b = { "branch" },
                    lualine_c = { "filename" },
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {
                        {
                            function()
                                local current_line = vim.fn.line(".")
                                local total_lines = vim.fn.line("$")
                                return current_line .. " | " .. total_lines
                            end,
                            separator = { right = " " },
                            left_padding = 2,
                        },
                    },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {},
            })

            -- Transparency logic for the middle section
            -- This overrides the 'c' (middle) section background to 'NONE'
            local colors = {
                transparent = "NONE",
            }

            local custom_gruvbox = require("lualine.themes.gruvbox")
            
            -- Apply transparency to the middle bar across all modes
            custom_gruvbox.normal.c.bg = colors.transparent
            custom_gruvbox.insert.c.bg = colors.transparent
            custom_gruvbox.visual.c.bg = colors.transparent
            custom_gruvbox.replace.c.bg = colors.transparent
            custom_gruvbox.command.c.bg = colors.transparent
            custom_gruvbox.inactive.c.bg = colors.transparent

            require("lualine").setup({ options = { theme = custom_gruvbox } })
        end,
    },
}
