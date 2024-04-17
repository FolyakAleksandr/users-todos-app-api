import UIKit

final class TodosViewController: UIViewController {
    // MARK: - Private properties

    private let todosTableView = UITableView()
    private let refreshControl = UIRefreshControl()

    // MARK: - Private variables

    private var todosArray = [Todo]() {
        didSet {
            todosTableView.reloadData()
            refreshControl.endRefreshing()
        }
    }

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgorund()
        setupUI()
        fetchData()
        setupRefreshControl()
    }

    // MARK: - Private methods

    private func setupUI() {
        layoutTodosTableView()
        appearanceTodosTableView()
    }

    private func layoutTodosTableView() {
        view.addSubview(todosTableView)
        todosTableView.translatesAutoresizingMaskIntoConstraints = false

        todosTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        todosTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        todosTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        todosTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }

    private func appearanceTodosTableView() {
        todosTableView.delegate = self
        todosTableView.dataSource = self
        todosTableView.backgroundColor = .white
        todosTableView.separatorStyle = .none
        todosTableView.showsVerticalScrollIndicator = false
        todosTableView.register(TodoCell.self, forCellReuseIdentifier: "TodoCell")
    }

    private func fetchData() {
        NetworkManager.instance.getTodos { [weak self] todo in
            guard let self = self else { return }
            self.todosArray = todo
        }
    }

    private func setupRefreshControl() {
        todosTableView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(swipreRefreshControl), for: .valueChanged)
    }

    @objc private func swipreRefreshControl(sender: UIRefreshControl) {
        sender.beginRefreshing()
        fetchData()
    }
}

// MARK: - Extension

extension TodosViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todosArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as? TodoCell else { return UITableViewCell() }

        let text = (todosArray[indexPath.row].title)
        let firstCharacter = text.prefix(1).capitalized
        let otherCharacters = text.dropFirst()
        let capitalizedString = firstCharacter + otherCharacters

        cell.setTodoTitle(text: capitalizedString)
        cell.selectionStyle = .none

        if todosArray[indexPath.row].completed {
            cell.accessoryView = UIImageView(image: UIImage(systemName: "checkmark.circle.fill"))
            cell.accessoryView?.tintColor = .systemBlue
            return cell
        } else {
            cell.accessoryView = UIImageView(image: UIImage(systemName: "circle"))
            cell.accessoryView?.tintColor = .systemBlue
            return cell
        }
    }
}
