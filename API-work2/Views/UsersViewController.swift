import UIKit

final class UsersViewController: UIViewController {
    // MARK: - Private properties

    private let usersTableView = UITableView()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgorund()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        layoutUsersTableView()
        configureUsersTableView()
    }

    private func layoutUsersTableView() {
        view.addSubview(usersTableView)
        usersTableView.translatesAutoresizingMaskIntoConstraints = false

        usersTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        usersTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        usersTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        usersTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }

    private func configureUsersTableView() {
        usersTableView.dataSource = self
        usersTableView.backgroundColor = .white
        usersTableView.separatorStyle = .none
        usersTableView.showsVerticalScrollIndicator = false
        usersTableView.register(UserCell.self, forCellReuseIdentifier: "UserCell")
    }
}

// MARK: - Extension

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell else { return UITableViewCell() }
        cell.setInfo(name: "", email: "")
        cell.selectionStyle = .none

        return cell
    }
}
