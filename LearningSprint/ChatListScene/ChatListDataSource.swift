//
//  ChatListDataSource.swift
//  LearningSprint
//
//  Created by 제민우 on 10/7/24.
//

import UIKit

class ChatListDataSource {
    var chatList: [ChatListModel] = [] {
        didSet {
            chatListInfoPublisher?(chatList)
        }
    }
    
    // MARK: - Output
    var chatListInfoPublisher: (([ChatListModel]) -> Void)?
}

// MARK: - Input
// 네트워킹 작업으로 추후 변경
extension ChatListDataSource {
    func fetchData() {
        chatList = [
            ChatListModel(userName: "당근1", time: "2024-10-07T11:58:45.123+0900", chatPreviewText: "안녕하세요"),
            ChatListModel(userName: "당근1", time: "2024-10-07T11:40:45.123+0900", chatPreviewText: "안녕하세요"),
            ChatListModel(userName: "당근1", time: "2024-10-07T08:40:45.123+0900", chatPreviewText: "안녕하세요"),
            ChatListModel(userName: "당근2", time: "2024-10-06T14:23:45.123+0900", chatPreviewText: "안녕하세요"),
            ChatListModel(userName: "당근3", time: "2024-09-24T14:23:45.123+0900", chatPreviewText: "안녕하세요"),
            ChatListModel(userName: "당근4", time: "2024-09-01T14:23:45.123+0900", chatPreviewText: "안녕하세요"),
            ChatListModel(userName: "당근5", time: "2023-03-07T14:23:45.123+0900", chatPreviewText: "안녕하세요"),
        ]
    }
}
