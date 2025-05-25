//
//  ContentView.swift
//  memo
//
//  Created by 高橋直斗 on 2025/05/11.
//

import SwiftUI
// UIを作るためのライブラリ
// ここの画面がメインになる

struct ContentView: View {
    // メイン画面の定義
    @StateObject var viewModel = MemoViewModel()
    // ViewModelを作成して監視状態にする。このViewが持ち主
    @State private var isPresentingAddMemo = false
    // sheet表示のトリガー

    var body: some View {
        NavigationView {
            // 画面にナビゲーションバーをつけるためのコンテナ
            List {
                ForEach(viewModel.memos) { memo in
                    // ViewModelのメモ配列をリスト表示する
                    VStack(alignment: .leading) {
                        Text(memo.title).font(.headline)
                        Text(memo.body).font(.subheadline).lineLimit(1)
                        // メモの中身を縦型に表示
                    }
                }
                .onDelete(perform: viewModel.deleteMemo)
                // スワイプで削除できるようにする
            }
            .navigationTitle("メモ一覧")
            // ナビゲーションバーに表示するタイトル
            .toolbar {
                Button(action: {
                    isPresentingAddMemo = true
                }) {
                    Image(systemName: "plus")
                }
                // SF Symbolsの＋アイコン。タップでsheetを表示
            }
            .sheet(isPresented: $isPresentingAddMemo) {
                AddMemoView(viewModel: viewModel)
                // sheetとしてAddMemoViewを表示
            }
        }
    }
}

#Preview {
    ContentView()
}
// プレビュー画面でこの画面が見られる
