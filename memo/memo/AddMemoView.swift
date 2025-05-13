//
//  AddMemoView.swift
//  memo
//
//  Created by 高橋直斗 on 2025/05/13.
//

import SwiftUI

struct AddMemoView: View {
    @Environment(\.dismiss) var dismiss // sheetを閉じるための環境変数
    @ObservedObject var viewModel: MemoViewModel

    @State private var title = ""
    @State private var memobody = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                TextField("タイトル", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextEditor(text: $memobody)
                    .frame(height: 200)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))

                Spacer()
            }
            .padding()
            .navigationTitle("新規メモ")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("保存") {
                        viewModel.addMemo(title: title, body: memobody)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("キャンセル") {
                        dismiss()
                    }
                }
            }
        }
    }
}
