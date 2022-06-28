local M = {}

M.tailwindcss = {
  filetypes = { "aspnetcorerazor", "blade", "html", "jade", "razor", "twig",
    "css", "less", "postcss", "sass", "scss", "stylus", "javascript",
    "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
  -- cmd = { "tailwindcss-language-server", "--stdio" },
  settings = {
    tailwindCSS = {
      classAttributes = { "class", "className", "classList", "ngClass" },
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning"
      },
      validate = true
    }
  }
}

return M
