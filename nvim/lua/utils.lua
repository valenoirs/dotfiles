vim.api.nvim_create_user_command("Bdelete", function(opts)
    local bufnr = vim.api.nvim_get_current_buf()
    local force = opts.bang 

    if vim.bo[bufnr].modified and not force then
        vim.notify("No write since last change (add ! to override)", vim.log.levels.ERROR)
        return
    end

    local buffers = vim.tbl_filter(function(b)
        return vim.api.nvim_buf_is_valid(b) and vim.bo[b].buflisted
    end, vim.api.nvim_list_bufs())

    if #buffers <= 1 and vim.api.nvim_buf_get_name(bufnr) == "" then
        return
    elseif #buffers <= 1 then
        local new_buf = vim.api.nvim_create_buf(true, false)
        vim.api.nvim_set_current_buf(new_buf)
    else
        local alternate = vim.fn.bufnr("#")
        if vim.api.nvim_buf_is_valid(alternate) and vim.bo[alternate].buflisted then
            vim.api.nvim_set_current_buf(alternate)
        else
            vim.cmd("bnext")
        end
    end

    local success, err = pcall(vim.cmd, (force and "bd! " or "bd ") .. bufnr)
    if not success then
        vim.notify("Error deleting buffer: " .. err, vim.log.levels.ERROR)
    end
end, { bang = true, desc = "Close buffer and keep split" })

vim.keymap.set("n", "<leader>x", ":Bdelete<CR>", { desc = "Close buffer" })
