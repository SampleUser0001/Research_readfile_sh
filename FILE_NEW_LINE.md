# 読み込みファイルの改行コードの違い

何故か設定ファイルの2行目を読んでくれないので原因調査。  
読み込み対象のファイル改行の違いの観点から調査

## 調査環境

Chromebook。

## 問題のsh

``` sh : readFile.sh
#!/bin/bash

while read data; do
  echo ${data}
done << END
`cat $1`
END
```

## 読み込むファイル

書いてある内容は同じで、改行の付け方をあれこれ変えてみる。
```
hoge
piyo
```

1. 改行コードを変える
   - LF, CR, CRLFの3種類。
     - CRはないかもしれんが・・・
2. 改行位置を変える
   - 末尾に改行が有るか無いかの違い。

ファイルは全部inputfiles配下においておく。

| 改行コード | 末尾の改行 | ファイル名 |
| :-- | :-- | :-- |
| LF | あり | LF_file_EOF_LF.txt |
| CR | あり | CR_file_EOF_CR.txt |
| CRLF | あり | CRLF_file_EOF_CRLF.txt |
| LF | なし | LF_file_EOF_none.txt |
| CR | なし | CR_file_EOF_none.txt |
| CRLF | なし | CRLF_file_EOF_none.txt |

## 調査

catの結果とshの出力を比較する。

### LF + 末尾改行あり

cat
```
ittimfn@penguin:~/Research_readfile_sh$ cat inputfiles/LF_file_EOF_LF.txt 
hoge
piyo
ittimfn@penguin:~/Research_readfile_sh$ 
```

sh実行

```
ittimfn@penguin:~/Research_readfile_sh$ cat inputfiles/LF_file_EOF_LF.txt 
hoge
piyo
ittimfn@penguin:~/Research_readfile_sh$ 
```

### CR + 末尾改行あり

cat
```
ittimfn@penguin:~/Research_readfile_sh$ cat inputfiles/CR_file_EOF_CR.txt 
ittimfn@penguin:~/Research_readfile_sh$ 
```

sh実行
```
ittimfn@penguin:~/Research_readfile_sh$ sh readFile.sh inputfiles/CR_file_EOF_CR.txt 
piyo
ittimfn@penguin:~/Research_readfile_sh$ 
```

### CRLF + 末尾改行あり

cat
```
ittimfn@penguin:~/Research_readfile_sh$ cat inputfiles/CRLF_file_EOF_CRLF.txt 
ittimfn@penguin:~/Research_readfile_sh$ 
```

sh実行
```
ittimfn@penguin:~/Research_readfile_sh$ sh readFile.sh inputfiles/CRLF_file_EOF_CRLF.txt 
piyo
ittimfn@penguin:~/Research_readfile_sh$ 
```

### LF + 末尾改行なし

問題のパターン

cat
```
ittimfn@penguin:~/Research_readfile_sh$ cat inputfiles/LF_file_EOF_none.txt 
hoge
piyoittimfn@penguin:~/Research_readfile_sh$ 
```

sh実行
```
ittimfn@penguin:~/Research_readfile_sh$ sh readFile.sh inputfiles/LF_file_EOF_none.txt 
hoge
piyo
ittimfn@penguin:~/Research_readfile_sh$ 
```

### CR + 末尾改行なし

cat
```
ittimfn@penguin:~/Research_readfile_sh$ cat inputfiles/CR_file_EOF_none.txt 
piyoittimfn@penguin:~/Research_readfile_sh$ 
```

sh実行
```
ittimfn@penguin:~/Research_readfile_sh$ sh readFile.sh inputfiles/CR_file_EOF_none.txt 
piyo
ittimfn@penguin:~/Research_readfile_sh$ 
```

### CRLF + 末尾改行なし

cat
```
ittimfn@penguin:~/Research_readfile_sh$ cat inputfiles/CRLF_file_EOF_none.txt 
piyoittimfn@penguin:~/Research_readfile_sh$ 
```

sh実行
```
ittimfn@penguin:~/Research_readfile_sh$ sh readFile.sh inputfiles/CRLF_file_EOF_none.txt 
piyo
ittimfn@penguin:~/Research_readfile_sh$ 
```
