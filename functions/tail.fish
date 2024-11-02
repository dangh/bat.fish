status is-interactive || return

function tail
    set -l original_argv $argv
    argparse -i n/lines= f -- $argv

    if set -q _flag_f
        command tail $original_argv
        return
    end

    set lines $_flag_lines
    test $lines -gt 0 2>/dev/null || set lines 10

    set -l files
    set -l flags
    for f in $argv
        if test -f $f
            set files $files $f
        else
            set flags $flags $f
        end
    end

    for f in $files
        set -l total_lines (wc -l < $f)
        set from (math $total_lines - $lines)

        bat $flags -r $from: $f
    end

end
