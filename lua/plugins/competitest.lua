local is_on_mac = false
if vim.fn.has("mac") then
    is_on_mac = true
end

local PORT = 27121
local TEMPLATE_PATH = "~/workspace/oi/template/template.cpp"
if is_on_mac then
    PORT = 10045
    TEMPLATE_PATH = "~/syqwq-workspace/oi/template/template.cpp"
end

return {
    "xeluxee/competitest.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
        require("competitest").setup({
            local_config_file_name = ".competitest.lua",

            -- floating_border = { style = "rounded" },
            floating_border = "rounded",
            -- floating_border = "solid",
            -- floating_border = "double",
            -- floating_border = "default",
            -- floating_border = "single",
            floating_border_highlight = "FloatBorder",
            picker_ui = {
                width = 0.2,
                height = 0.3,
                mappings = {
                    focus_next = { "j", "<down>", "<Tab>" },
                    focus_prev = { "k", "<up>", "<S-Tab>" },
                    close = { "<esc>", "<C-c>", "q", "Q" },
                    submit = { "<cr>" },
                },
            },
            editor_ui = {
                popup_width = 0.4,
                popup_height = 0.6,
                show_nu = true,
                show_rnu = false,
                normal_mode_mappings = {
                    switch_window = { "<C-h>", "<C-l>", "<C-i>" },
                    save_and_close = "<C-s>",
                    cancel = { "q", "Q" },
                },
                insert_mode_mappings = {
                    switch_window = { "<C-h>", "<C-l>", "<C-i>" },
                    save_and_close = "<C-s>",
                    cancel = "<C-q>",
                },
            },
            runner_ui = {
                -- interface = "split",
                interface = "popup",
                selector_show_nu = true,
                selector_show_rnu = false,
                show_nu = true,
                show_rnu = false,
                mappings = {
                    run_again = "R",
                    run_all_again = "<C-r>",
                    kill = "K",
                    kill_all = "<C-k>",
                    view_input = { "i", "I" },
                    view_output = { "a", "A" },
                    view_stdout = { "o", "O" },
                    view_stderr = { "e", "E" },
                    toggle_diff = { "d", "D" },
                    close = { "q", "Q" },
                },
                viewer = {
                    width = 0.5,
                    height = 0.5,
                    show_nu = true,
                    show_rnu = false,
                    open_when_compilation_fails = true,
                },
            },
            popup_ui = {
                total_width = 0.8,
                total_height = 0.8,
                layout = {
                    { 4, "tc" },
                    { 5, { { 1, "so" }, { 1, "si" } } },
                    { 5, { { 1, "eo" }, { 1, "se" } } },
                },
            },
            split_ui = {
                position = "right",
                relative_to_editor = true,
                total_width = 0.3,
                vertical_layout = {
                    { 1, "tc" },
                    { 1, { { 1, "si" }, { 1, "se" } } },
                    { 1, { { 1, "so" }, { 1, "eo" } } },
                },
                total_height = 0.4,
                horizontal_layout = {
                    { 2, "tc" },
                    { 3, { { 1, "so" }, { 1, "si" } } },
                    { 3, { { 1, "eo" }, { 1, "se" } } },
                },
            },

            save_current_file = true,
            save_all_files = false,
            compile_directory = ".",
            compile_command = {
                c = { exec = "gcc", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
                cpp = {
                    exec = "sh",
                    args = {
                        "-c",
                        "mkdir -p .exec && g++ -Wall --std=c++17 $(FNAME) -o .exec/$(FNOEXT)",
                    },
                },
                -- cpp = { exec = "g++", args = { "-Wall", "--std=c++17", "$(FNAME)", "-o", "./.exec/$(FNOEXT)" } },
                rust = { exec = "rustc", args = { "$(FNAME)" } },
                java = { exec = "javac", args = { "$(FNAME)" } },
            },
            -- running_directory = ".",
            running_directory = ".",
            run_command = {
                c = { exec = "./$.exec/(FNOEXT)" },
                cpp = { exec = "./.exec/$(FNOEXT)" },
                rust = { exec = "./$(FNOEXT)" },
                python = { exec = "python", args = { "$(FNAME)" } },
                java = { exec = "java", args = { "$(FNOEXT)" } },
            },
            multiple_testing = -1,
            maximum_time = 5000,
            output_compare_method = "squish",
            view_output_diff = false,

            testcases_directory = "./testcase",
            testcases_use_single_file = false,
            -- testcases_use_single_file = true,
            testcases_auto_detect_storage = true,
            testcases_single_file_format = "$(FNOEXT).testcases",
            testcases_input_file_format = "$(FNOEXT)_input$(TCNUM).txt",
            testcases_output_file_format = "$(FNOEXT)_output$(TCNUM).txt",

            companion_port = PORT,
            receive_print_message = true,
            start_receiving_persistently_on_setup = false,
            -- template_file = false,
            template_file = {
                -- cpp = "~/workspace/oi/template/template.cpp",
                -- cpp = "~/syqwq-workspace/oi/template/template.cpp",
                cpp = TEMPLATE_PATH,
            },
            -- evaluate_template_modifiers = false,
            evaluate_template_modifiers = true,
            date_format = "%c",
            received_files_extension = "cpp",
            -- received_problems_path = "$(CWD)/$(PROBLEM).$(FEXT)",
            received_problems_path = function(task, file_extension)
                local cwd = vim.fn.getcwd()
                if string.match(task.group, "AtCoder") then
                    -- https://atcoder.jp/contests/abc411/tasks/abc411_a
                    local contest_id, problem_id = string.match(task.url, "contests/(%w+)/tasks/([%w_]+)")
                    return string.format("%s/atcoder/%s/%s.%s", cwd, contest_id, problem_id, file_extension)
                end

                -- acwing
                if string.match(task.group, "AcWing") then
                    local problem_id = string.match(task.url, "www.acwing.com/problem/content/(%d+)/")
                    if problem_id == nil then
                        problem_id = string.match(task.url, "www.acwing.com/problem/content/description/(%d+)/")
                    end
                    return string.format("%s/acwing/%s.%s", cwd, problem_id, file_extension)
                end

                -- codeforces
                if string.match(task.group, "Codeforces") then
                    if string.match(task.url, "contest") then
                        local contest_id, problem_id =
                            string.match(task.url, "codeforces.com/contest/([0-9]*)/problem/([A-Z0-9]+)")
                        return string.format("%s/codeforces/%s/%s.%s", cwd, contest_id, problem_id, file_extension)
                    else
                        local contest_id, problem_id =
                            string.match(task.url, "codeforces.com/problemset/problem/([0-9]*)/([A-Z0-9]+)")
                        return string.format("%s/codeforces/%s.%s", cwd, contest_id .. problem_id, file_extension)
                    end
                end

                -- luogu
                if string.match(task.group, "Luogu") then
                    local problem_id = string.match(task.url, "luogu.com.cn/problem/([%w_]+)")
                    return string.format("%s/luogu/%s.%s", cwd, problem_id, file_extension)
                end

                -- poj
                if string.match(task.group, "POJ") then
                    -- local problem_id = string.match(task.url, "poj.org/problem?id=([A-Z0-9]+)")
                    local problem_id = string.match(task.url, "id=([A-Z0-9]+)")
                    return string.format("%s/poj/%s.%s", cwd, problem_id, file_extension)
                end

                -- others
                return string.format("%s/others/%s.%s", cwd, (string.gsub(task.name, "%s+", "-")), file_extension)
            end,
            received_problems_prompt_path = true,
            received_contests_directory = "$(CWD)",
            received_contests_problems_path = "$(PROBLEM).$(FEXT)",
            received_contests_prompt_directory = true,
            received_contests_prompt_extension = true,
            open_received_problems = true,
            open_received_contests = true,
            replace_received_testcases = false,
        })
    end,
}
