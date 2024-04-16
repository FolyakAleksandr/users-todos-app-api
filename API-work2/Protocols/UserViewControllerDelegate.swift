import Foundation
protocol UserViewControllerDelegate: AnyObject {
    func dataTransfer(index: IndexPath) -> User
}
