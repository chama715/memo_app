//
//  MemoView.swift
//  memo
//
//  Created by 高橋直斗 on 2025/05/12.
//

import Foundation
//Swiftの基本機能を使うためのライブラリ

class MemoViewModel: ObservableObject {
    //SwiftUIと連携できるようになるクラス。
    @Published var memos: [Memo] = []
    //メモの一覧を保持する配列。@Publisedをつけると内容が変わったら自動更新される
    
    func addMemo(title: String, body: String) {
        //新しいメモを作って追加する関数。。
        let newMemo = Memo(id: UUID(), title: title, body: body, date: Date())
        //メモを作成して・・・
        memos.append(newMemo)
        //配列に追加
    }
}

//プルリク練習
