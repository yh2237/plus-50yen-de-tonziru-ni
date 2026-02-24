#!/bin/bash
set -e

if [[ $EUID -ne 0 ]]; then
    echo "rootで実行してください。"
    exit 1
fi

rm -f /etc/profile.d/plus-50yen-de-tonziru-ni.sh
rm -f /usr/local/share/plus-50yen-de-tonziru-ni/tonziru.png
rmdir /usr/local/share/plus-50yen-de-tonziru-ni 2>/dev/null || true

echo "アンインストール完了。"