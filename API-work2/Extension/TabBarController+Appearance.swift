import UIKit
extension TabBarController {
    func appearanceTabBarController() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .systemGray3
        
        appearance.stackedLayoutAppearance.normal.iconColor = .white
        appearance.stackedLayoutAppearance.selected.iconColor = .systemBlue
        
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
        ]
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.systemBlue,
        ]
        
        self.tabBarController.tabBar.standardAppearance = appearance
        self.tabBarController.tabBar.scrollEdgeAppearance = appearance
    }
}
