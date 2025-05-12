//
//  Memo.swift
//  memo
//
//  Created by 高橋直斗 on 2025/05/12.
//

import Foundation
//Swiftの基本機能を使うためのライブラリ

struct Memo: Identifiable, Codable {
    //Memo構造体を定義
    //Identifiableはプロトコルの1つで、自分のIDを持っているよ、という意味を持つ。Listに必要
    //Codableもプロトコルの1つ。保存したり読み込んだりできるよ！の意味
    let id: UUID
    //各メモを一意に識別するためのID。自動で生成される。
    var title: String
    var body: String
    var date: Date
}
//メモのタイトル、本文、作成日時の変数を定義
