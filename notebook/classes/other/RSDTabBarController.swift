//
//  RSDTabBarController.swift
//  livebook
//
//  Created by 赵超豪 on 2024/11/14.
//

import UIKit

class RSDTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabbar()
        self.setupViewController()
    }
    private func setupTabbar(){
        self.tabBar.layer.shadowColor = UIColor.rsd.hex("#000000").cgColor
        self.tabBar.layer.shadowOffset = CGSizeMake(0, -1)
        self.tabBar.layer.shadowOpacity = 0.15
//        self.tabBar.unselectedItemTintColor =
//        self.tabBar.tintColor =
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.backgroundImage = UIImage()
        appearance.shadowImage = UIImage()
        appearance.shadowColor = .clear
        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            self.tabBar.scrollEdgeAppearance = appearance
        }
    }
    
    private func setupViewController(){
        
        if let homeVC = HomeMainController.rsd.initWithXib() {
            let vc = RSDBaseNavigationController(rootViewController: homeVC)
            self.addChild(controller: vc, image: UIImage(named: "tabbar_home"), selectedImage: UIImage(named: "tabbar_home"), title: "首页")
        }
        if let feedlistVC = FeedListMainController.rsd.initWithXib() {
            let vc = RSDBaseNavigationController(rootViewController: feedlistVC)
            self.addChild(controller: vc, image: UIImage(named: "tabbar_list"), selectedImage: UIImage(named: "tabbar_list"), title: "树洞")
        }
        if let meVC = CenterMainController.rsd.initWithXib() {
            let vc = RSDBaseNavigationController(rootViewController: meVC)
            self.addChild(controller: vc, image: UIImage(named: "tabbar_center"), selectedImage: UIImage(named: "tabbar_center"), title: "我的")
        }
    }
    
    private func addChild(controller: UIViewController, image: UIImage?, selectedImage: UIImage?, title: String){
        controller.tabBarItem.image = image?.rsd.scaleForWidth(width: 30)?.withRenderingMode(.alwaysOriginal)
        controller.tabBarItem.selectedImage = selectedImage?.rsd.scaleForWidth(width: 30)?.withRenderingMode(.alwaysOriginal)
        controller.tabBarItem.title = title
        self.addChild(controller)
    }
    
}
