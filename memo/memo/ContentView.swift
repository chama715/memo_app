//
//  ContentView.swift
//  memo
//
//  Created by 高橋直斗 on 2025/05/11.
//

import SwiftUI
//UIを作るためのライブラリ
//ここの画面がメインになるのかな


struct ContentView: View {
    //メイン画面の定義
    @StateObject var viewModel = MemoViewModel()
    //ViewModelを作成して監視状態にする。@StateObjectなのでこのViewが持ち主

    var body: some View {
        NavigationView {
            //画面にナビゲーションバーをつけるためのコンテナ
            List(viewModel.memos) { memo in
                //ViewModelのメモ配列をリスト表示する
                VStack(alignment: .leading) {
                    Text(memo.title).font(.headline)
                    Text(memo.body).font(.subheadline).lineLimit(1)
                    //メモの中身を縦型に表示
                }
            }
            .navigationTitle("メモ一覧")
            //ナビゲーションバーに表示するタイトル
            .toolbar {
                Button(action: {
                    viewModel.addMemo(title: "タイトル", body: "本文")
                    //右上の＋ボタンで、メモを1件追加
                }) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}
//SF SymbolsというApple純正のアイコン

#Preview {
    ContentView()
}
//プレビュー画面でこの画面が見られる
