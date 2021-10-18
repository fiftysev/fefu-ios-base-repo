

import UIKit

class TabsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBar()
    }

    private func createTabBar() {
        let tabBarController = UITabBarController(nibName: nil, bundle: nil)
        
        let activityNavigationController = UINavigationController(rootViewController: ActivityViewController())
        let profileNavigationController = UINavigationController(rootViewController: ProfileViewController())
        
        activityNavigationController.tabBarItem.title = "Активности"
        activityNavigationController.tabBarItem.image = UIImage(systemName: "circle")
        
        profileNavigationController.tabBarItem.title = "Профиль"
        profileNavigationController.tabBarItem.image = UIImage(systemName: "circle")
        
        tabBarController.setViewControllers([activityNavigationController, profileNavigationController], animated: true)
        
        tabBarController.modalPresentationStyle = .overFullScreen
        
        present(tabBarController, animated: true, completion: nil)
    }
}
