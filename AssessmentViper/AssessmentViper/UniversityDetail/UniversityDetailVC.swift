//
//  UniversityDetailVC.swift
//  AssessmentViper
//
//  Created by Ruchit on 07/08/24.
//

import UIKit

protocol UniversityDetailViewProtocol {
    
    var presenter: UniversityDetailPresenterProtocol? { get set }
    
    func update(with university: University)
    func update(with error: String)
    
}

class UniversityDetailVC: UIViewController {
    
    var presenter: UniversityDetailPresenterProtocol?
    
    private let cardView = UIView()
    private let universityNameLabel = UILabel()
    private let universityStateLabel = UILabel()
    private let countryLabel = UILabel()
    private let countryCodeLabel = UILabel()
    private let refreshButton = UIButton()
    var url: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    private func setupView() {
        title = "University Detail"
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // Card View
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 10
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 0.1
        cardView.layer.shadowOffset = CGSize(width: 0, height: 5)
        cardView.layer.shadowRadius = 10
        view.addSubview(cardView)
        
        NSLayoutConstraint.activate([
            cardView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            cardView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            cardView.widthAnchor.constraint(equalToConstant: 300),
            cardView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        // University Name Label
        universityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        universityNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        universityNameLabel.numberOfLines = 0
        universityNameLabel.lineBreakMode = .byWordWrapping
        cardView.addSubview(universityNameLabel)
        
        // University State Label
        universityStateLabel.translatesAutoresizingMaskIntoConstraints = false
        universityStateLabel.font = UIFont.systemFont(ofSize: 16)
        cardView.addSubview(universityStateLabel)
        
        // Country Label
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.font = UIFont.systemFont(ofSize: 16)
        cardView.addSubview(countryLabel)
        
        // Country Code Label
        countryCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        countryCodeLabel.font = UIFont.systemFont(ofSize: 16)
        cardView.addSubview(countryCodeLabel)
        
        // Web Page Button
        let webPageButton = UIButton(type: .system)
        webPageButton.translatesAutoresizingMaskIntoConstraints = false
        webPageButton.setTitle("Web Page", for: .normal)
        webPageButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        webPageButton.addTarget(self, action: #selector(openWebPage), for: .touchUpInside)
        cardView.addSubview(webPageButton)
        
        // Refresh Button
        let refreshButton = UIButton()
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        let refreshImage = UIImage(systemName: "arrow.clockwise")
        refreshButton.setImage(refreshImage, for: .normal)
        refreshButton.tintColor = .gray
        cardView.addSubview(refreshButton)
        
        NSLayoutConstraint.activate([
            universityNameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            universityNameLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            universityNameLabel.trailingAnchor.constraint(equalTo: refreshButton.trailingAnchor, constant: -20),
            
            universityStateLabel.topAnchor.constraint(equalTo: universityNameLabel.bottomAnchor, constant: 10),
            universityStateLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            
            countryLabel.topAnchor.constraint(equalTo: universityStateLabel.bottomAnchor, constant: 10),
            countryLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            
            countryCodeLabel.topAnchor.constraint(equalTo: countryLabel.topAnchor),
            countryCodeLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            webPageButton.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 10),
            webPageButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            
            refreshButton.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            refreshButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20)
        ])
    }
    
    @objc func openWebPage() {
        if let url = url {
            UIApplication.shared.open(url)
        }
    }
    
}

extension UniversityDetailVC: UniversityDetailViewProtocol {
    
    func update(with university: University) {
        universityNameLabel.text = university.name
        universityStateLabel.text = university.state
        countryLabel.text = university.country
        countryCodeLabel.text = university.countryCode
        self.url = university.url
    }
    
    func update(with error: String) {
        // handle the error
        print("Error: ", error)
    }
    
    
}
