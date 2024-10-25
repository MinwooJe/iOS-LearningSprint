//
//  ChatListDTO.swift
//  LearningSprint
//
//  Created by 제민우 on 10/3/24.
//

import UIKit

struct ChatListDTO {
    let profileImage: UIImage?
    let userName: String
    let address: String
    let time: String
    let chatPreviewText: String
    
    init(
        profileImage: UIImage? = UIImage(),
        userName: String,
        address: String = "대연동",
        time: String,
        chatPreviewText: String
    ) {
        self.profileImage = profileImage
        self.userName = userName
        self.address = address
        self.time = time
        self.chatPreviewText = chatPreviewText
    }
}
