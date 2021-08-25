local map = vim.api.nvim_set_keymap

-- map the leader key
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = " " -- 'vim.g' sets global variables

options = { noremap = true, silent = true }
-- center search results
map('n', 'n', 'nzz', options)
map('n', 'N', 'Nzz', options)

-- better indenting
map("v", "<", "<gv", options)
map("v", ">", ">gv", options)

-- paste over currently selected text without yanking it
map('v', 'p', '"_dP', options)

-- Tab switch buffer
map("n", "<TAB>", ":bnext<CR>", options)
map("n", "<S-TAB>", ":bprevious<CR>", options)

-- Change behaviour of Y similar to C and D
map("n", "Y", "y$", options)

-- Cancel search highlighting with ESC
map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", options)

-- previously opened buffer
map("n", "<Leader><TAB>", ":e#<CR>", options)

-- Resizing panes
map("n", "<Left>", ":vertical resize +1<CR>", options)
map("n", "<Right>", ":vertical resize -1<CR>", options)
map("n", "<Up>", ":resize -1<CR>", options)
map("n", "<Down>", ":resize +1<CR>", options)

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", options)
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", options)

-- Move current line / block with Alt-j/k ala vscode.
-- captured by window manager for now
-- map("n", "<A-j>", ":m .+1<CR>==", options)
-- map("n", "<A-k>", ":m .-2<CR>==", options)
-- map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", options)
-- map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", options)
-- map("x", "<A-j>", ":m '>+1<CR>gv-gv", options)
-- map("x", "<A-k>", ":m '<-2<CR>gv-gv", options)

-- starlite mappings
map("n", "*", "<cmd>lua require'starlite'.star()<CR>", options)
map("n", "g*", "<cmd>lua require'starlite'.g_star()<CR>", options)
map("n", "#", "<cmd>lua require'starlite'.hash()<CR>", options)
map("n", "g#", "<cmd>lua require'starlite'.g_hash()<CR>", options)

local wk = require("which-key")

wk.register({
  ga = {"<Plug>(EasyAlign)", "Align", mode="x"},
})

-- Register all leader based mappings
wk.register({
  p = { "<cmd>NvimTreeToggle<cr>", "Toogle Tree"},
  b = {
    name = "Buffers",
    p = { "<cmd>BufferLineMovePrev<cr>", "Move buffer prev"},
    n = { "<cmd>BufferLineMoveNext<cr>", "Move buffer next"},
    j = { "<cmd>BufferPick<cr>", "jump to buffer" },
    f = { "<cmd>Telescope buffers<cr>", "Find buffer" },
    e = {
      "<cmd>BufferCloseAllButCurrent<cr>",
      "close all but current buffer",
    },
    x = { "<cmd>Bdelete!<CR>", "Close Buffer" },
    h = { "<cmd>BufferLineCloseLeft<cr>", "close all buffers to the left" },
    l = {
      "<cmd>BufferLineCloseRight<cr>",
      "close all BufferLines to the right",
    },
    D = {
      "<cmd>BufferLineSortByDirectory<cr>",
      "sort BufferLines automatically by directory",
    },
    L = {
      "<cmd>BufferLineSortByExtension<cr>",
      "sort BufferLines automatically by extension",
    },
  },
  g = {
    name = "Git",
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    t = "Open Gitui",
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    B = { "<cmd>GitBlameToggle<cr>", "Toogle Blame" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    C = {
      "<cmd>Telescope git_bcommits<cr>",
      "Checkout commit(for current file)",
    },
  },
  j = {
    name = "jump",
    w = {"<cmd>lua require'hop'.hint_words()<cr>", "Words"},
    c = {"<cmd>lua require'hop'.hint_char2()<cr>", "Chars"},
    l = {"<cmd>lua require'hop'.hint_lines()<cr>"},
  },
  l = {
      name = "LSP",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
      d = {
        "<cmd>Telescope lsp_document_diagnostics<cr>",
        "Document Diagnostics",
      },
      w = {
        "<cmd>Telescope lsp_workspace_diagnostics<cr>",
        "Workspace Diagnostics",
      },
      -- f = { "<cmd>silent FormatWrite<cr>", "Format" },
      f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
      i = { "<cmd>LspInfo<cr>", "Info" },
      j = {
        "<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
        "Next Diagnostic",
      },
      k = {
        "<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
        "Prev Diagnostic",
      },
      q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
      S = {
        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        "Workspace Symbols",
      },
    },
  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    f = { "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'fd', '--hidden', '--type', 'file', '--follow'}})<cr>", "Find File" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    l = {
      f = "Open LF"
    },
    y = "Symbols",
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    t = { "<cmd>Telescope live_grep<cr>", "Text" },
    T = { "<cmd>NvimTreeFindFile<CR>", "Find in Tree" },
    s = { "<cmd>Telescope grep_string<cr>", "Text under cursor" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    p = { "<cmd>Telescope projects<cr>", "Projects"},
    P = {
      "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
      "Colorscheme with Preview",
    },
  },
  t = {
    name = "Trouble",
    w = {"<cmd>Trouble lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
    d = {"<cmd>Trouble lsp_document_diagnostics<cr>", "Document Diagnostic"},
    l = {"<cmd>Trouble loclist<cr>", "Loclist"},
    q = {"<cmd>Trouble quickfix<cr>", "Quickfix"},
    t = {"<cmd>TodoTrouble<cr>", "Todos"},
    r = {"<cmd>Trouble lsp_references<cr>", "LSP References"},
  }

}, { prefix = "<leader>", mode = "n", noremap = true, silent = true })
