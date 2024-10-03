//
//  ChatListViewController.swift
//  LearningSprint
//
//  Created by 제민우 on 10/3/24.
//

import UIKit

class ChatListViewController: UIViewController {
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubvies()
        configureLayout()
    }
}

// MARK: - Configure UI
extension ChatListViewController {
    private func configureSubvies() {
        [tableView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: safeArea.topAnchor
            ),
            tableView.bottomAnchor.constraint(
                equalTo: safeArea.bottomAnchor
            ),
            tableView.leadingAnchor.constraint(
                equalTo: safeArea.leadingAnchor
            ),
            tableView.trailingAnchor.constraint(
                equalTo: safeArea.trailingAnchor
            ),
            
        ])
    }
}
