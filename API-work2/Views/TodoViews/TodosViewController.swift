import UIKit

final class TodosViewController: UIViewController {
    // MARK: - Private properties

    private let todosTableView = UITableView()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgorund()
        setupUI()
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
}

// MARK: - Extension

extension TodosViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as? TodoCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.setTodoTitle(text: "")
        
        return cell
    }
    
    
}
