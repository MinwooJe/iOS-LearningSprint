//
//  ChatListViewController.swift
//  LearningSprint
//
//  Created by 제민우 on 10/3/24.
//

import UIKit

class ChatListViewController: UIViewController {
    private let tableView = UITableView()
    var chatListArray = [ChatListModel]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    let chatListDataSource = ChatListDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubvies()
        configureLayout()
        configureInitialSetting()
        chatListDataSource.fetchData()
    }
}

// MARK: - Configure Initial Setting
extension ChatListViewController {
    private func configureInitialSetting() {
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.register(ChatListTableViewCell.self, forCellReuseIdentifier: "ChatListTableViewCell")
        
        chatListDataSource.chatListInfoPublisher = { [weak self] chatList in
            self?.chatListArray = chatList
        }
    }
}

// MARK: - Convert Data
extension ChatListViewController {
    private func parseTime(from timeString: String) -> String {
        var resultTime: String = ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        guard let postedDate = dateFormatter.date(from: timeString) else { return "" }
        
        let currentDate = Date()
        
        let calendar = Calendar.current
    
        let components = calendar.dateComponents([.year, .weekOfYear, .day, .hour, .minute, .second], from: postedDate, to: currentDate)
        
        if let deltaYear = components.year, deltaYear > 0 {
            resultTime = "\(deltaYear)년 전"
        } else if let deltaMonth = components.month, deltaMonth > 0 {
            resultTime = "\(deltaMonth)달 전"
        } else if let deltaWeekOfYear = components.weekOfYear, deltaWeekOfYear > 0 {
            resultTime = "\(deltaWeekOfYear)주 전"
        } else if let deltaDay = components.day, deltaDay > 0 {
            resultTime = "\(deltaDay)일 전"
        } else if let deltaHour = components.hour, deltaHour > 0 {
            resultTime = "\(deltaHour)시간 전"
        } else if let deltaMinute = components.minute, deltaMinute > 0 {
            resultTime = "\(deltaMinute)분 전"
        } else if let deltaSecond = components.second, deltaSecond >= 0 {
            resultTime = "\(deltaSecond)초 전"
        }
        return resultTime
    }
}

// MARK: - Configure TalbeView DataSource
extension ChatListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "ChatListTableViewCell",
            for: indexPath
        ) as? ChatListTableViewCell else { return UITableViewCell() }
        
        let data = chatListArray[indexPath.row]
        
        cell.configureContents(
            profileImage: data.profileImage,
            userName: data.userName,
            postTime: parseTime(from: data.time),
            chatPreview: data.chatPreviewText
        )
        
        return cell
    }
}

// MARK: - Configure TableView Delegate
extension ChatListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
            )
        ])
    }
}
