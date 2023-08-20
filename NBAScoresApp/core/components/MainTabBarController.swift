//
//  MainTabBarController.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 14/08/23.
//

import UIKit

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .secondarySystemBackground
        let customBarButtonItem = CustomBarButtonItem.createCustomBarButton(imageName: Images.nba, target: nil, action: nil)
        
        // MARK: - Scores Tab
        let firstViewController = ScoresRouter.showScores()
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 0)
        firstViewController.tabBarItem.title = "Scores"
        
        let firstNavigationController = CustomNavigationController(rootViewController: firstViewController, title: "Games", prefersLargeTitles: true, rightBarButtonItem: customBarButtonItem)

        
        // MARK: - Standings Tab
        let secondViewController = StandingsRouter.showStandings()
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
        secondViewController.tabBarItem.title = "Standings"
        
        let secondNavigationController = CustomNavigationController(rootViewController: secondViewController, title: "Standings", prefersLargeTitles: true, rightBarButtonItem: customBarButtonItem)
        
        // MARK: - Settings Tab
        let thirdViewController = SettingsRouter.showSettings()
        thirdViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        thirdViewController.tabBarItem.title = "Settings"
        
        let thirdNavigationController = CustomNavigationController(rootViewController: thirdViewController, title: "Settings", prefersLargeTitles: true, rightBarButtonItem: customBarButtonItem)
        
        viewControllers = [firstNavigationController, secondNavigationController, thirdNavigationController]
    }
}

