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
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if self.traitCollection.userInterfaceStyle == .dark {
            self.darkStyle()
        }
        if self.traitCollection.userInterfaceStyle == .light {
            self.lightStyle()
        }
    }
    
    private func setupTabbar(){
        self.tabBar.layer.shadowColor = UIColor.rsd.hex("#000000").cgColor
        self.tabBar.layer.shadowOffset = CGSizeMake(0, -1)
        self.tabBar.layer.shadowOpacity = 0.15
    }
    private func lightStyle(){
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
    private func darkStyle(){
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
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
            self.addChild(controller: vc, image: UIImage(named: "tabbar_item_none_01"), selectedImage: UIImage(named: "tabbar_item_selected_01"), title: "日记列表")
        }
        if let feedlistVC = FeedListMainController.rsd.initWithXib() {
            let vc = RSDBaseNavigationController(rootViewController: feedlistVC)
            self.addChild(controller: vc, image: UIImage(named: "tabbar_item_none_02"), selectedImage: UIImage(named: "tabbar_item_selected_02"), title: "广场")
        }
        if let meVC = CenterMainController.rsd.initWithXib() {
            let vc = RSDBaseNavigationController(rootViewController: meVC)
            self.addChild(controller: vc, image: UIImage(named: "tabbar_item_none_03"), selectedImage: UIImage(named: "tabbar_item_selected_03"), title: "我的")
        }
    }
    
    private func addChild(controller: UIViewController, image: UIImage?, selectedImage: UIImage?, title: String){
        controller.tabBarItem.image = image?.withRenderingMode(.alwaysOriginal)
        controller.tabBarItem.selectedImage = selectedImage?.withRenderingMode(.alwaysOriginal)
        controller.tabBarItem.title = title
        self.addChild(controller)
    }
    
}
