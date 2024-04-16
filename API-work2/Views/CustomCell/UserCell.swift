import UIKit

final class UserCell: UITableViewCell {
    // MARK: - Private properties

    private let backView = UIView()
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()

    // MARK: - Lyfe cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupUI() {
        layoutBackView()
        layoutNameLabel()
        layoutEmailLabel()

        appearanceBackView()
        appearanceLabels()
    }

    private func layoutBackView() {
        contentView.addSubview(backView)
        backView.translatesAutoresizingMaskIntoConstraints = false

        backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }

    private func appearanceBackView() {
        backView.backgroundColor = .systemGray6
        backView.layer.cornerRadius = 6
    }

    private func layoutNameLabel() {
        backView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        nameLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10).isActive = true
    }

    private func layoutEmailLabel() {
        backView.addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false

        emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10).isActive = true
        emailLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10).isActive = true
        emailLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -10).isActive = true
    }

    private func appearanceLabels() {
        nameLabel.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.bold)
        nameLabel.textColor = .black

        emailLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.regular)
        emailLabel.textColor = .darkGray
    }

    // MARK: - Public Methods
    public func setInfo(name: String, email: String) {
        nameLabel.text = name
        emailLabel.text = email
    }
}
