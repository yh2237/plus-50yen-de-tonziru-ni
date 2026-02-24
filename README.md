# plus-50yen-de-tonziru-ni

rootで危険なコマンドを実行しようとすると、プラス50円で豚汁に変更してくれます。

## 必要なもの

- bash
- chafa（なくても動くが、**豚汁が出てこない**）

## インストール

```bash
git clone https://github.com/yh2237/plus-50yen-de-tonziru-ni
cd plus-50yen-de-tonziru-ni
chmod +x install.sh
sudo ./install.sh
```

`chafa` が入っていない場合インストールするか聞かれます（**chafaが無いと豚汁が出てきません！**）

## アンインストール

```bash
chmod +x uninstall.sh
sudo ./uninstall.sh
```

インストール後、新しいrootシェルから有効になります。

## 動作

root のシェルで以下のコマンドを実行しようとすると介入してきます。

- `rm`
- `mkfs`
- `dd`
- `shutdown`
- `reboot`
- `poweroff`
- `shred`
- `wipefs`
- `fdisk`
- `parted`

```
rm -rf /tmp/test をプラス50円で豚汁に変更できます。変更しますか？ (Y/n):
```

`Y` を選ぶとコマンドが中止され、豚汁が出てきます。
`n` を選ぶとそのまま実行されます。