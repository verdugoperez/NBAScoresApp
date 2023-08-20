//
//  CustomUIBarButtonItem.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 14/08/23.
//

import UIKit
class CustomBarButtonItem {

    static func createCustomBarButton(imageName: String, target: AnyObject?, action: Selector?) -> UIBarButtonItem {
        let customImageView = UIImageView(image: UIImage(named: imageName))
        customImageView.contentMode = .scaleAspectFill
        customImageView.frame = CGRect(x: 0, y: 0, width: 40, height: 80)

        let customImageViewContainer = UIView(frame: customImageView.frame)
        customImageViewContainer.addSubview(customImageView)

        let customBarButton = UIBarButtonItem(customView: customImageViewContainer)
        customBarButton.target = target
        customBarButton.action = action

        return customBarButton
    }
}

