//
//  MessageCollectionViewCell.swift
//  LearningSprint
//
//  Created by 제민우 on 10/25/24.
//

import UIKit

class MessageCollectionViewCell: UICollectionViewCell {
    private let partnerProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "person.circle.fill")
        imageView.tintColor = .lightGray
        return imageView
    }()
    
    private let messageContentView: MessageContentView
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "오전 11:47"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    init(isPartner: Bool) {
        messageContentView = MessageContentView(isPartner: isPartner)
        super.init(frame: .zero)
        configureSubviews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MessageCollectionViewCell {
    private func configureSubviews() {
        [partnerProfileImageView, messageContentView, timeLabel].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            partnerProfileImageView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor
            ),
            partnerProfileImageView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor
            ),
            partnerProfileImageView.heightAnchor.constraint(
                equalToConstant: 50
            ),
            partnerProfileImageView.widthAnchor.constraint(
                equalTo: partnerProfileImageView.heightAnchor
            ),

            messageContentView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor
            ),
            messageContentView.leadingAnchor.constraint(
                equalTo: partnerProfileImageView.trailingAnchor, constant: 3
            ),
            messageContentView.centerYAnchor.constraint(
                equalTo: safeAreaLayoutGuide.centerYAnchor
            ),

            timeLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: messageContentView.trailingAnchor, constant: 3),
            timeLabel.trailingAnchor.constraint(
                lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -15
            )
        ])
    }
}
