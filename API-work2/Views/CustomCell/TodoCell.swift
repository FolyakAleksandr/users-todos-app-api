import UIKit

final class TodoCell: UITableViewCell {
    // MARK: - Private properties
    
    private let backView = UIView()
    private let todoLabel = UILabel()
    
    // MARK: - Lyfe cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        layoutBackView()
        layoutTodoLabel()
        
        appearanceBackView()
        appearanceTodoLabel()
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
    
    private func layoutTodoLabel() {
        backView.addSubview(todoLabel)
        todoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        todoLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 12).isActive = true
        todoLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12).isActive = true
        todoLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12).isActive = true
        todoLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -12).isActive = true
    }
    
    private func appearanceTodoLabel() {
        todoLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium)
        todoLabel.numberOfLines = 5
    }
    
    // MARK: - Public methods
    
    public func setTodoTitle(text: String) {
        todoLabel.text = text
    }
}
