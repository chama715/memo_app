//
//  MemoView.swift
//  memo
//
//  Created by 高橋直斗 on 2025/05/12.
//

import Foundation
//UIは使わないからFoundation

class MemoViewModel: ObservableObject {
    //SwiftUIに状態を伝えるクラス
    @Published var memos: [Memo] = [] {
        didSet {
            saveMemos()
        }
    }
    //メモの配列
    //@Pulishedで変更を監視して自動で画面に反映。
    //didSetで中身に変更があれば自動で保存。

    init() {
        loadMemos()
    }
    //ViewModelが作られたときにloadMemos()を呼び、保存済みのメモを復元

    func addMemo(title: String, body: String) {
        let newMemo = Memo(id: UUID(), title: title, body: body, date: Date())
        memos.append(newMemo)
    }
        //入力されたタイトルと本文で、新しいメモを作って配列に追加

    private func saveMemos() {
        if let encoded = try? JSONEncoder().encode(memos) {
            UserDefaults.standard.set(encoded, forKey: "memos")
        }
    }
 //メモ一覧をJSONにして、UserDefaultsに保存

    private func loadMemos() {
        if let savedData = UserDefaults.standard.data(forKey: "memos"),
           let decoded = try? JSONDecoder().decode([Memo].self, from: savedData) {
            memos = decoded
        }
    }
    //保存されたデータを読み込んで、memosに復元


    func deleteMemo(at offsets: IndexSet) {
        memos.remove(atOffsets: offsets)
    }
    //スワイプで削除された一のメモを削除
    
}
