return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            win = {
              list = {
                keys = {
                  -- Relative path
                  ["y"] = "copy_relative_path",

                  -- Absolute path
                  ["Y"] = "copy_absolute_path",
                },
              },
            },

            actions = {
              copy_relative_path = function(picker, item)
                if not item or not item.file then
                  return
                end

                local path = vim.fn.fnamemodify(item.file, ":.")
                vim.fn.setreg("+", path)

                Snacks.notify.info("Copied relative path: " .. path, {
                  title = "Explorer",
                })
              end,

              copy_absolute_path = function(picker, item)
                if not item or not item.file then
                  return
                end

                local path = vim.fn.fnamemodify(item.file, ":p")
                vim.fn.setreg("+", path)

                Snacks.notify.info("Copied absolute path: " .. path, {
                  title = "Explorer",
                })
              end,
            },
          },
        },
      },
    },
  },
}
