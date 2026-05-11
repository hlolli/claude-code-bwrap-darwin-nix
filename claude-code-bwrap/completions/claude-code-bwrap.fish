# Fish completions for claude-code-bwrap
# Before -- complete directories; after -- args are passed to claude.
function __claude_code_bwrap_before_separator
    not contains -- -- (commandline -opc)
end
complete -c claude-code-bwrap -n __claude_code_bwrap_before_separator -f -a '(__fish_complete_directories)'
