#!/bin/bash
set -e

if [[ $EUID -ne 0 ]]; then
    echo "rootで実行してください。"
    exit 1
fi

TARGET="/etc/profile.d/plus-50yen-de-tonziru-ni.sh"

echo "plus-50yen-de-tonziru-ni をインストールします..."

if [[ ! -f tonziru.png ]]; then
    echo "tonziru.png が見つかりませんでした。スクリプトと同じディレクトリに置いてください。"
    exit 1
fi

if ! command -v chafa >/dev/null 2>&1; then
    echo
    read -p "chafa が見つかりません。インストールしますか？（chafa が無いと豚汁が出てきません！） (Y/n): " ans
    ans=${ans:-Y}

    if [[ "$ans" =~ ^[Yy]$ ]]; then
        if command -v apt >/dev/null 2>&1; then
            apt update
            apt install -y chafa
        else
            echo "apt が見つかりませんでした。手動で chafa をインストールしてください。"
        fi
    fi
fi

install -m 644 plus-50yen-de-tonziru-ni.sh "$TARGET"
install -d /usr/local/share/plus-50yen-de-tonziru-ni
install -m 644 tonziru.png /usr/local/share/plus-50yen-de-tonziru-ni/tonziru.png

echo "インストール完了。新しいrootシェルで有効になります。"