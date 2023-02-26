--- romgrk/barbar.nvim
local M = {}

function M.setup()
  vim.keymap.set(
    "n",
    "<S-Tab>",
    "<Cmd>BufferPrevious<CR>",
    { desc = "Previous buffer" }
  )

  vim.keymap.set("n", "<Tab>", "<Cmd>BufferNext<CR>", { desc = "Next buffer" })

  vim.keymap.set(
    "n",
    "<A-,>",
    "<Cmd>BufferPrevious<CR>",
    { desc = "Previous buffer" }
  )

  vim.keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>", { desc = "Next buffer" })

  vim.keymap.set(
    "n",
    "<A-<>",
    "<Cmd>BufferMovePrevious<CR>",
    { desc = "Move buffer to the left" }
  )

  vim.keymap.set(
    "n",
    "<A->>",
    "<Cmd>BufferMoveNext<CR>",
    { desc = "Move buffer to the right" }
  )

  vim.keymap.set(
    "n",
    "<A-1>",
    "<Cmd>BufferGoto 1<CR>",
    { desc = "Go to buffer 1" }
  )

  vim.keymap.set(
    "n",
    "<A-2>",
    "<Cmd>BufferGoto 2<CR>",
    { desc = "Go to buffer 2" }
  )

  vim.keymap.set(
    "n",
    "<A-3>",
    "<Cmd>BufferGoto 3<CR>",
    { desc = "Go to buffer 3" }
  )

  vim.keymap.set(
    "n",
    "<A-4>",
    "<Cmd>BufferGoto 4<CR>",
    { desc = "Go to buffer 4" }
  )

  vim.keymap.set(
    "n",
    "<A-5>",
    "<Cmd>BufferGoto 5<CR>",
    { desc = "Go to buffer 5" }
  )

  vim.keymap.set(
    "n",
    "<A-6>",
    "<Cmd>BufferGoto 6<CR>",
    { desc = "Go to buffer 6" }
  )

  vim.keymap.set(
    "n",
    "<A-7>",
    "<Cmd>BufferGoto 7<CR>",
    { desc = "Go to buffer 7" }
  )

  vim.keymap.set(
    "n",
    "<A-8>",
    "<Cmd>BufferGoto 8<CR>",
    { desc = "Go to buffer 8" }
  )

  vim.keymap.set(
    "n",
    "<A-9>",
    "<Cmd>BufferGoto 9<CR>",
    { desc = "Go to buffer 9" }
  )

  vim.keymap.set(
    "n",
    "<A-0>",
    "<Cmd>BufferLast<CR>",
    { desc = "Go to last buffer" }
  )

  vim.keymap.set(
    "n",
    "<A-p>",
    "<Cmd>BufferPin<CR>",
    { desc = "Toggle buffer pin" }
  )

  vim.keymap.set(
    "n",
    "<A-c>",
    "<Cmd>BufferClose<CR>",
    { desc = "Close buffer" }
  )

  vim.keymap.set("n", "Q", "<Cmd>BufferClose<CR>", { desc = "Close buffer" })

  vim.keymap.set(
    "n",
    "<Leader>bc",
    "<Cmd>BufferClose!<CR>",
    { desc = "Close buffer (force)" }
  )

  vim.keymap.set(
    "n",
    "<Leader>bD",
    "<Cmd>BufferOrderByDirectory<CR>",
    { desc = "Sort buffers by directory" }
  )

  vim.keymap.set(
    "n",
    "<Leader>be",
    "<Cmd>BufferCloseAllButCurrent<CR>",
    { desc = "Close all but current buffer" }
  )

  vim.keymap.set(
    "n",
    "<Leader>bh",
    "<Cmd>BufferCloseBuffersLeft<CR>",
    { desc = "Close all buffers to the left" }
  )

  vim.keymap.set("n", "<Leader>bj", "<Cmd>BufferPick<CR>", {
    desc = "Jump to buffer",
  })

  vim.keymap.set(
    "n",
    "<Leader>bl",
    "<Cmd>BufferCloseBuffersRight<CR>",
    { desc = "Close all buffers to the right" }
  )

  vim.keymap.set(
    "n",
    "<Leader>bL",
    "<Cmd>BufferOrderByLanguage<CR>",
    { desc = "Sort buffers by language" }
  )

  vim.keymap.set("n", "<Leader>bp", "<Cmd>BufferPin<CR>", {
    desc = "Toggle buffer pin",
  })

  vim.keymap.set(
    "n",
    "<Leader>bP",
    "<Cmd>BufferCloseAllButPinned<CR>",
    { desc = "Close all but pinned buffers" }
  )
end

return M
