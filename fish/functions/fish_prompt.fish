function fish_prompt
    set -l last_status $status
    set -l cwd (basename (prompt_pwd))

    # Git branch
    set -l git_branch (git branch --show-current 2>/dev/null)

    # Prompt
    if test $last_status -ne 0
        set_color red
    else
        set_color green
    end
    printf "❯ "
    set_color normal

    printf "%s" $cwd

    if test -n "$git_branch"
        set_color yellow
        printf " (%s)" $git_branch
        set_color normal
    end

    printf " "
end
