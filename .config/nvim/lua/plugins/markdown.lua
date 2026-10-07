return {
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" },
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    keys = {
      {
        "<leader>mp",
        "<cmd>MarkdownPreviewToggle<cr>",
        ft = "markdown",
        desc = "Markdown Preview",
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    ft = { "markdown", "quarto", "rmd", "org" },
    opts = {
      file_types = { "markdown", "quarto", "rmd", "org" },
    },
    keys = {
      {
        "<leader>um",
        "<cmd>RenderMarkdown toggle<cr>",
        ft = { "markdown", "quarto", "rmd", "org" },
        desc = "Toggle Markdown Rendering",
      },
    },
  },
}
