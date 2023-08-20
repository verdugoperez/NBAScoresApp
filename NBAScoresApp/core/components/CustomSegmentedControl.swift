//
//  CustomSegmentedControl.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 14/08/23.
//

import UIKit

class SegmentedControl: UISegmentedControl {
    
    init(items: [String]) {
        super.init(frame: .zero)
        setupSegmentedControl(items: items)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSegmentedControl(items: [String]) {
        self.translatesAutoresizingMaskIntoConstraints = false
        let selectedTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.selectedSegmentTintColor = .red
        self.setTitleTextAttributes(selectedTextAttributes, for: .selected)
       
        self.removeAllSegments()
        for (index, item) in items.enumerated() {
            self.insertSegment(withTitle: item, at: index, animated: false)
        }
        
        self.selectedSegmentIndex = 0
    }
}
