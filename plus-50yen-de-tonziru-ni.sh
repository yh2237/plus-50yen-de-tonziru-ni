#!/bin/bash

[[ $EUID -ne 0 ]] && return
[[ $- != *i* ]] && return

COMMANDS=(
    "rm"
    "mkfs"
    "dd"
    "shutdown"
    "reboot"
    "poweroff"
    "shred"
    "wipefs"
    "fdisk"
    "parted"
)

confirm_root_danger() {
    trap '' DEBUG

    for cmd in "${COMMANDS[@]}"; do
        if [[ "$BASH_COMMAND" == "$cmd" || "$BASH_COMMAND" == "$cmd "* ]]; then
            echo
            read -p "$BASH_COMMAND をプラス50円で豚汁に変更できます。変更しますか？(Y/n) " ans

            ans=${ans:-N}

            if [[ "$ans" =~ ^[Yy]$ ]]; then
                trap confirm_root_danger DEBUG
                echo "豚汁に変更しました！"
                command -v chafa >/dev/null 2>&1 && chafa --size=32 "/usr/local/share/plus-50yen-de-tonziru-ni/tonziru.png"
                kill -INT $$
                return
            fi
        fi
    done

    trap confirm_root_danger DEBUG
}

trap confirm_root_danger DEBUG