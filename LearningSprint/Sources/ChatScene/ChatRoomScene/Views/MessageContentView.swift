//
//  MessageContentView.swift
//  LearningSprint
//
//  Created by 제민우 on 10/21/24.
//

import UIKit

class MessageContentView: UIView {
    private let messageContentLabel: UILabel = {
        let label = UILabel()
        label.text = "Label LabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabel"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private let messageBackGroundView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()
    
    init(isPartner: Bool) {
        super.init(frame: .zero)
        messageContentLabel.textColor = isPartner ? .black : .white
        messageBackGroundView.backgroundColor = isPartner ? .systemGray5 : .orange
        configureSubviews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MessageContentView {
    private func configureSubviews() {
        messageBackGroundView.addSubview(messageContentLabel)
        messageContentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [messageBackGroundView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        messageBackGroundView.setContentHuggingPriority(.required, for: .vertical)
        messageBackGroundView.setContentHuggingPriority(.required, for: .horizontal)
        NSLayoutConstraint.activate([
            messageBackGroundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            messageBackGroundView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            messageBackGroundView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            messageBackGroundView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            
            messageContentLabel.topAnchor.constraint(equalTo: messageBackGroundView.topAnchor, constant: 5),
            messageContentLabel.leadingAnchor.constraint(equalTo: messageBackGroundView.leadingAnchor, constant: 5),
            messageContentLabel.centerXAnchor.constraint(equalTo: messageBackGroundView.centerXAnchor),
            messageContentLabel.centerYAnchor.constraint(equalTo: messageBackGroundView.centerYAnchor)
        ])
    }
}
