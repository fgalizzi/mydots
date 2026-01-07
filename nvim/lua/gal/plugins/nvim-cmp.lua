return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")

    local lspkind = require("lspkind")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    -- To see updates while you type 
    require("luasnip").setup({
      update_events = "TextChangedI"
    })
    

    -- MY SNIPPETS 
    local s = luasnip.snippet
    local t = luasnip.text_node
    local i = luasnip.insert_node
    local extras = require("luasnip.extras")
    local rep = extras.rep

    -- CPP
    luasnip.add_snippets("cpp", {
      s("out", {
        t('std::cout << '), i(1), t(' << std::endl;'),
      })
    })

    -- CPP ROOT
    luasnip.add_snippets("cpp", {
      s("canvas", {
        t('TCanvas* '), i(1), t(' = new TCanvas("'), rep(1), t('","'), rep(1), t('",0,0,800,600);'),
        t({'',''}), i(0),
        rep(1), t('->cd();'),
        t({'',''}), i(0),
        t({'',''}), i(0),
        rep(1), t('->Modified(); '), rep(1), t("->Update();"),
      })
    })

    luasnip.add_snippets("cpp", {
      s("histo", {
        t('TH1D* '), i(1), t(' = new TH1D("'), rep(1), t('",Form("%s;%s;%s","'), rep(1), t('","x","y") , , );'),
      })
    })

    luasnip.add_snippets("cpp", {
      s("histo2", {
        t('TH2D* '), i(1), t(' = new TH2D("'), rep(1), t('", Form("%s;%s;%s", "", "", ""), , , , , , );'),
      })
    })

    luasnip.add_snippets("cpp", {
      s("function",{
        t('TF1* '), i(1), t(' = new TF1("'), rep(1), t('", , , ();'),
        t({'',''}), i(0),
        rep(1), t('->SetNpx(2000);')
      })
    })
    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp"}, --lsp completion
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
      }),

      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })
  end,
}
