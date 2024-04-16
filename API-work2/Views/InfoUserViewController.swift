import UIKit

final class InfoUserViewController: UIViewController {
    // MARK: - Private properties

    private let personalDataTitleLabel = UILabel()
    private let addressTitleLabel = UILabel()
    private let companyTitleLabel = UILabel()
    
    private let personalDataStackView = UIStackView()
    private let nameLabel = UILabel()
    private let usernameLabel = UILabel()
    private let emailLabel = UILabel()
    private let phoneLabel = UILabel()
    private let websiteLabel = UILabel()
    
    private let addressStackView = UIStackView()
    private let streetLabel = UILabel()
    private let suiteLabel = UILabel()
    private let cityLabel = UILabel()
    private let zipcodeLabel = UILabel()
    private let geoLabel = UILabel()
    
    private let companyStackView = UIStackView()
    private let nameCompanyLabel = UILabel()
    private let catchPhraseLabel = UILabel()
    private let businessStrategyLabel = UILabel()
    
    // MARK: - Variables
    
    // MARK: - Lyfe cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgorund()
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        configureTitles()
        
        layoutPersonalDataTitleLabel()
        layoutPersonalDataStackView()
        layoutAddressTitleLabel()
        layoutAddressStackView()
        layoutCompanyTitleLabel()
        layoutCompanyStackView()
        
        configurePersonalDataStackView()
        configureAddressStackView()
        configureCompanyStackView()
    }
    
    private func configureTitles() {
        for element in [personalDataTitleLabel, addressTitleLabel, companyTitleLabel] {
            element.font = UIFont.systemFont(ofSize: 26, weight: UIFont.Weight.bold)
            element.textColor = .black
        }
        personalDataTitleLabel.text = "Personal data:"
        addressTitleLabel.text = "Address data:"
        companyTitleLabel.text = "Company data:"
    }
    
    private func layoutPersonalDataTitleLabel() {
        view.addSubview(personalDataTitleLabel)
        personalDataTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        personalDataTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        personalDataTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        personalDataTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    }
    
    private func layoutPersonalDataStackView() {
        view.addSubview(personalDataStackView)
        personalDataStackView.translatesAutoresizingMaskIntoConstraints = false
        
        personalDataStackView.topAnchor.constraint(equalTo: personalDataTitleLabel.bottomAnchor, constant: 10).isActive = true
        personalDataStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        personalDataStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
    }
    
    private func layoutAddressTitleLabel() {
        view.addSubview(addressTitleLabel)
        addressTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addressTitleLabel.topAnchor.constraint(equalTo: personalDataStackView.bottomAnchor, constant: 15).isActive = true
        addressTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        addressTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    }
    
    private func layoutAddressStackView() {
        view.addSubview(addressStackView)
        addressStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addressStackView.topAnchor.constraint(equalTo: addressTitleLabel.bottomAnchor, constant: 10).isActive = true
        addressStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        addressStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
    }
    
    private func layoutCompanyTitleLabel() {
        view.addSubview(companyTitleLabel)
        companyTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        companyTitleLabel.topAnchor.constraint(equalTo: addressStackView.bottomAnchor, constant: 15).isActive = true
        companyTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        companyTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    }
    
    private func layoutCompanyStackView() {
        view.addSubview(companyStackView)
        companyStackView.translatesAutoresizingMaskIntoConstraints = false
        
        companyStackView.topAnchor.constraint(equalTo: companyTitleLabel.bottomAnchor, constant: 10).isActive = true
        companyStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        companyStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
    }
    
    private func configurePersonalDataStackView() {
        for element in [nameLabel, usernameLabel, emailLabel, phoneLabel, websiteLabel] {
            personalDataStackView.addArrangedSubview(element)
            element.numberOfLines = 2
        }
        personalDataStackView.axis = .vertical
        personalDataStackView.distribution = .fillEqually
        personalDataStackView.alignment = .fill
        personalDataStackView.spacing = 5
    }
    
    private func configureAddressStackView() {
        for element in [streetLabel, suiteLabel, cityLabel, zipcodeLabel, geoLabel] {
            addressStackView.addArrangedSubview(element)
            element.numberOfLines = 2
        }
        addressStackView.axis = .vertical
        addressStackView.distribution = .fillEqually
        addressStackView.alignment = .fill
        addressStackView.spacing = 5
    }
    
    private func configureCompanyStackView() {
        for element in [nameCompanyLabel, catchPhraseLabel, businessStrategyLabel] {
            companyStackView.addArrangedSubview(element)
            element.numberOfLines = 2
        }
        companyStackView.axis = .vertical
        companyStackView.distribution = .fillEqually
        companyStackView.alignment = .fill
        companyStackView.spacing = 5
    }
}
