import UIKit

final class UsersViewController: UIViewController {
    // MARK: - Private Properties

    private let usersTableView = UITableView()
    private let refreshControl = UIRefreshControl()

    // MARK: - Private variables

    private var usersArray = [User]() {
        didSet {
            usersTableView.reloadData()
            refreshControl.endRefreshing()
        }
    }

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgorund()
        setupUI()
        setupRefreshControl()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
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

    private func fetchData() {
        NetworkManager.instance.getUsers { [weak self] users in
            guard let self = self else { return }
            self.usersArray = users
        }
    }

    private func setupRefreshControl() {
        usersTableView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(swipeRefreshControl), for: .valueChanged)
    }
    
    @objc private func swipeRefreshControl(sender: UIRefreshControl) {
        sender.beginRefreshing()
        fetchData()
    }
}

// MARK: - Extension

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell else { return UITableViewCell() }
        cell.setInfo(
            name: "\(usersArray[indexPath.row].name)",
            email: "\(usersArray[indexPath.row].email)")
        cell.selectionStyle = .none

        return cell
    }
}
