status is-interactive || return

function head
    argparse -i n/lines= -- $argv

    set lines $_flag_lines
    test $lines -gt 0 2>/dev/null || set lines 10

    bat -r :$lines $argv
end
