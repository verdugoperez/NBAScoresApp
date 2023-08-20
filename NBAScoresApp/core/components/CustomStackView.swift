//
//  CustomStackView.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 10/08/23.
//

import UIKit

class CustomStackView: UIStackView {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(alignment: Alignment, distribution: Distribution, spacing: CGFloat, axis: NSLayoutConstraint.Axis) {
        self.init(frame: .zero)
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
        self.axis = axis
        self.translatesAutoresizingMaskIntoConstraints = false
      
    }
}
