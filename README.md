# LRUキャッシュの開発

## テスト容易性: 高 重要度: 高
- [ ] Mapのような仕組み
    - [x] キャッシュのタプルの配列を用意する
        - [x] type(of:)で(String,String)になるか
    - [x] 辞書式のデータを追加
        - [x] ("a", "dataA")を追加
        - [x] ("a", "dataA")と("b", "dataB")を追加
    - [x]辞書式のデータを取得
        - [x] "dataA"をget("a")で取得
        - [x] "dataB"をget("b")で取得
        - [x] nilをget("c")で取得
    - [ ] 辞書式のデータを削除
    - [ ] データを取得したとき、なければnilを返す

- [ ] キャッシュの最大サイズに達した時、最も使われていないデータから順に消される
    - [ ] キャッシュの最大サイズに達するか検知
        - [ ] キャッシュの最大サイズを設定
        - [ ] キャッシュの最大サイズに達したか返す
    - [ ] 最も使われていないデータを選択
        - [ ] データが使われたらそのデータを最後に移動
    - [ ] 最も使われていないデータの削除
