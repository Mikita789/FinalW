//
//  StartTabBar.swift
//  FinalW
//
//  Created by Никита Попов on 22.03.24.
//

import UIKit

class StartTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBar()

        // Do any additional setup after loading the view.
    }
    
    private func createTabBar(){
        let  firstVC = UINavigationController(rootViewController: ViewController())
        firstVC.tabBarItem = UITabBarItem(title: "Вылет", image: UIImage(systemName: "airplane.departure"), tag: 0)
        let secVC = UINavigationController(rootViewController: SecondViewController())
        secVC.tabBarItem = UITabBarItem(title: "Прилет", image: UIImage(systemName: "airplane.arrival"), tag: 1)

        self.viewControllers = [firstVC, secVC]
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .black
    }

}
