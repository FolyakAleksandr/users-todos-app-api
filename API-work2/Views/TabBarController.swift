import UIKit

class TabBarController {
    static let instance = TabBarController()
    let tabBarController = UITabBarController()
    
    func setupTabBar(usersVC: UIViewController, todosVC: UIViewController) -> UITabBarController {
        tabBarController.viewControllers = [usersVC, todosVC]
        usersVC.tabBarItem = UITabBarItem(
            title: "Users",
            image: UIImage(systemName: "person.circle.fill"),
            tag: 0)
        todosVC.tabBarItem = UITabBarItem(
            title: "Todos",
            image: UIImage(systemName: "list.bullet.rectangle.portrait.fill"),
            tag: 1)
        
        tabBarController.selectedIndex = 0
        tabBarController.tabBar.isTranslucent = false
        
        appearanceTabBarController()
        
        return tabBarController
    }
}
