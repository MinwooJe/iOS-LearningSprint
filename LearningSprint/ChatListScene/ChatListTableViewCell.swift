//
//  ChatListTableViewCell.swift
//  LearningSprint
//
//  Created by 제민우 on 10/3/24.
//

import UIKit

final class ChatListTableViewCell: UITableViewCell {
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray3
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "사용자 닉네임"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let addressTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "사용자 주소·시간"
        label.textColor = .systemGray2
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let chatPreviewLabel: UILabel = {
        let label = UILabel()
        label.text = "채팅 내용"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private let profileHeaderStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }()
    
    private let chatTextStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        configureSubvies()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure UI
extension ChatListTableViewCell {
    private func configureSubvies() {
        [nameLabel, addressTimeLabel].forEach {
            profileHeaderStackView.addArrangedSubview($0)
        }
        
        [profileHeaderStackView, chatPreviewLabel].forEach {
            chatTextStackView.addArrangedSubview($0)
        }
        
        [profileImageView, chatTextStackView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            // MARK: - profileImageView Constraints
            profileImageView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: 16
            ),
            profileImageView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 16
            ),
            profileImageView.centerYAnchor.constraint(
                equalTo: safeAreaLayoutGuide.centerYAnchor
            ),
            profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor),
            
            // MARK: - chatTextStackView Constraints
            chatTextStackView.topAnchor.constraint(
                equalTo: profileImageView.topAnchor
            ),
            chatTextStackView.bottomAnchor.constraint(
                equalTo: profileImageView.bottomAnchor
            ),
            chatTextStackView.leadingAnchor.constraint(
                equalTo: profileImageView.trailingAnchor, constant: 16
            ),
            chatTextStackView.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -50
            ),
        ])
    }
}
