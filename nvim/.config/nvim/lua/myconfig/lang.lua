-- Language-specific settings
local M = {}
local vim = vim

-- Set up language-specific settings
function M.setup()
    -- Golang settings
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "go",
        callback = function()
            -- Tab settings for Go
            vim.opt_local.expandtab = false
            vim.opt_local.tabstop = 4
            vim.opt_local.shiftwidth = 4

            -- Go keymaps
            vim.keymap.set("n", "<leader>gt", ":GoTest<CR>", { buffer = true, desc = "Go Test" })
            vim.keymap.set("n", "<leader>gtf", ":GoTestFunc<CR>", { buffer = true, desc = "Go Test Function" })
            vim.keymap.set("n", "<leader>gr", ":GoRun<CR>", { buffer = true, desc = "Go Run" })
            vim.keymap.set("n", "<leader>gi", ":GoImports<CR>", { buffer = true, desc = "Go Imports" })
            vim.keymap.set("n", "<leader>gI", ":GoImpl<CR>", { buffer = true, desc = "Go Implement Interface" })
            vim.keymap.set("n", "<leader>gfs", ":GoFillStruct<CR>", { buffer = true, desc = "Go Fill Struct" })
        end,
    })

    -- PHP settings
    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "php", "blade" },
        callback = function()
            -- Tab settings for PHP
            vim.opt_local.expandtab = true
            vim.opt_local.tabstop = 4
            vim.opt_local.shiftwidth = 4

            -- PHP keymaps
            if vim.fn.filereadable("artisan") == 1 then
                -- Laravel specific keymaps
                vim.keymap.set("n", "<leader>pa", ":!php artisan<Space>", { buffer = true, desc = "PHP Artisan" })
                vim.keymap.set("n", "<leader>pm", ":!php artisan migrate<CR>", { buffer = true, desc = "PHP Migrate" })
                vim.keymap.set("n", "<leader>pmf", ":!php artisan migrate:fresh<CR>",
                    { buffer = true, desc = "PHP Migrate Fresh" })
                vim.keymap.set("n", "<leader>pms", ":!php artisan migrate:status<CR>",
                    { buffer = true, desc = "PHP Migrate Status" })
                vim.keymap.set("n", "<leader>pt", ":!php artisan tinker<CR>", { buffer = true, desc = "PHP Tinker" })
            end
        end,
    })

    -- JavaScript/TypeScript settings
    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
        callback = function()
            -- Tab settings for JS/TS
            vim.opt_local.expandtab = true
            vim.opt_local.tabstop = 2
            vim.opt_local.shiftwidth = 2

            -- JS/TS keymaps
            vim.keymap.set("n", "<leader>ji", ":TypescriptOrganizeImports<CR>",
                { buffer = true, desc = "Organize Imports" })
            vim.keymap.set("n", "<leader>jf", ":TypescriptFixAll<CR>", { buffer = true, desc = "Fix All" })
            vim.keymap.set("n", "<leader>jr", ":TypescriptRenameFile<CR>", { buffer = true, desc = "Rename File" })

            -- Check for package.json to determine project type
            if vim.fn.filereadable("package.json") == 1 then
                local package_json = vim.fn.json_decode(vim.fn.readfile("package.json"))

                -- React specific settings
                if package_json.dependencies and (package_json.dependencies.react or package_json.dependencies["react-dom"]) then
                    vim.keymap.set("n", "<leader>jc", ":.!npx generate-react-cli component ",
                        { buffer = true, desc = "Generate React Component" })
                end

                -- Add npm run commands
                if package_json.scripts then
                    vim.keymap.set("n", "<leader>jd", ":!npm run dev<CR>", { buffer = true, desc = "NPM Run Dev" })
                    vim.keymap.set("n", "<leader>jb", ":!npm run build<CR>", { buffer = true, desc = "NPM Run Build" })
                    vim.keymap.set("n", "<leader>jt", ":!npm run test<CR>", { buffer = true, desc = "NPM Run Test" })
                end
            end
        end,
    })

    -- Java settings
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
            -- Tab settings for Java
            vim.opt_local.expandtab = true
            vim.opt_local.tabstop = 4
            vim.opt_local.shiftwidth = 4

            -- Java keymaps
            vim.keymap.set("n", "<leader>jo", ":lua require('jdtls').organize_imports()<CR>",
                { buffer = true, desc = "Organize Imports" })
            vim.keymap.set("n", "<leader>jv", ":lua require('jdtls').extract_variable()<CR>",
                { buffer = true, desc = "Extract Variable" })
            vim.keymap.set("n", "<leader>jc", ":lua require('jdtls').extract_constant()<CR>",
                { buffer = true, desc = "Extract Constant" })
            vim.keymap.set("n", "<leader>jm", ":lua require('jdtls').extract_method()<CR>",
                { buffer = true, desc = "Extract Method" })

            -- Check for Maven or Gradle
            if vim.fn.filereadable("pom.xml") == 1 then
                vim.keymap.set("n", "<leader>jb", ":!mvn clean install<CR>", { buffer = true, desc = "Maven Build" })
                vim.keymap.set("n", "<leader>jt", ":!mvn test<CR>", { buffer = true, desc = "Maven Test" })
            elseif vim.fn.filereadable("build.gradle") == 1 or vim.fn.filereadable("build.gradle.kts") == 1 then
                vim.keymap.set("n", "<leader>jb", ":!./gradlew build<CR>", { buffer = true, desc = "Gradle Build" })
                vim.keymap.set("n", "<leader>jt", ":!./gradlew test<CR>", { buffer = true, desc = "Gradle Test" })
            end
        end,
    })

    -- HTML/CSS settings
    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "html", "css", "scss" },
        callback = function()
            -- Tab settings for HTML/CSS
            vim.opt_local.expandtab = true
            vim.opt_local.tabstop = 2
            vim.opt_local.shiftwidth = 2
        end,
    })

    -- Markdown settings
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
            -- Enable spell checking for markdown
            vim.opt_local.spell = true
            vim.opt_local.wrap = true
            vim.opt_local.linebreak = true
        end,
    })
end

return M
