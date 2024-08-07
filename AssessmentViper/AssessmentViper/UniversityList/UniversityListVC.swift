//
//  UniversityListVC.swift
//  AssessmentViper
//
//  Created by Ruchit on 07/08/24.
//

import UIKit

protocol UniversityListViewProtocol {
    
    var presenter: UniversityListPresenterProtocol? { get set }
    
    func update(with universities: [University])
    func update(with error: String)
}

class UniversityListVC: UIViewController {
    
    var presenter: UniversityListPresenterProtocol?
    private let tableView = UITableView()
    private let messageLabel = UILabel()
    private var universities: [University] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        style()
        layout()
        presenter?.viewDidLoad()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let selectedIndex = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndex, animated: true)
        }
    }
    
    private func setupView() {
        title = "Universities"
    }
}

extension UniversityListVC {
    
    private func style() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.isHidden = false
        messageLabel.text = "Loading..."
        messageLabel.font = UIFont.systemFont(ofSize: 20)
        messageLabel.textColor = .black
        messageLabel.textAlignment = .center
    }
    
    private func layout() {
        view.addSubview(tableView)
        view.addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
        ])
    }
    
}

extension UniversityListVC: UniversityListViewProtocol {
    
    func update(with universities: [University]) {
        DispatchQueue.main.async {
            self.universities = universities
            self.messageLabel.isHidden = true
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async {
            self.universities = []
            self.messageLabel.isHidden = false
            self.tableView.isHidden = true
            self.messageLabel.text = error
        }
    }
}

extension UniversityListVC: UITableViewDelegate {
    // when click on any university
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.tapOnDetail(universities[indexPath.row])
    }
}

extension UniversityListVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.selectionStyle = .none
        var content = cell.defaultContentConfiguration()
        let university = universities[indexPath.row]
        content.text = university.name
        content.secondaryText = university.state
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
