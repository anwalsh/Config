local vo = vim.opt_local
local set = vim.api.nvim_set_var

vo.tabstop = 4
vo.shiftwidth = 4
vo.softtabstop = 4

set("go_highlight_array_whitespace_error", 1)
set("go_highlight_extra_types", 1)
set("go_highlight_chan_whitespace_error", 1)
set("go_highlight_operators", 1)
set("go_highlight_functions", 1)
set("go_highlight_function_parameters", 1)
set("go_highlight_types", 1)
set("go_highlight_fields", 1)
set("go_highlight_build_constraints", 1)
set("go_highlight_generate_tags", 1)
set("go_highlight_variable_declarations", 1)
set("go_highlight_variable_assignments", 1)

set("go_fmt_fail_silently", 1)
set("go_def_mapping_enabled", 0)
