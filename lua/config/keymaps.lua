vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Sair do modo terminal" })
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    if vim.bo.modified and vim.bo.buftype == "" then
      vim.api.nvim_command("silent! write")
    end
  end,
  nested = true,
  desc = "Auto-save global que acorda o Flutter",
})
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Salvar arquivo" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Mover bloco para baixo" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Mover bloco para cima" })
vim.keymap.set("v", "∆", ":m '>+1<cr>gv=gv", { desc = "Mover bloco para baixo" })
vim.keymap.set("v", "˚", ":m '<-2<cr>gv=gv", { desc = "Mover bloco para cima" })
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indentar para frente" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Indentar para trás" })
vim.keymap.set("n", "<Tab>", ">>", { desc = "Indentar linha para frente" })
vim.keymap.set({ "n", "v", "i" }, "<A-S-f>", function()
  LazyVim.format({ force = true })
end, { desc = "Formatar Arquivo" })
vim.keymap.set({ "n", "v", "i" }, "Ï", function()
  LazyVim.format({ force = true })
end, { desc = "Formatar Arquivo (Mac)" })
vim.keymap.set({ "n", "v" }, "0", "$", { desc = "Ir para o final da linha" })
vim.keymap.set({ "n", "v" }, "$", "0", { desc = "Ir para o início da linha" })
vim.keymap.set("n", "<leader><leader>", function()
  Snacks.picker.recent()
end, { desc = "Arquivos Recentes" })

vim.keymap.set("n", "<leader>ff", function()
  Snacks.picker.files()
end, { desc = "Buscar Arquivos (Projeto)" })
