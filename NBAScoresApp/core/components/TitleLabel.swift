//
//  TitleLabel.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 10/08/23.
//

import UIKit

class TitleLabel: UILabel {
    enum FontStyle {
        case bold
        case italic
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat, fontStyle: FontStyle, text: String? = nil, textColor: UIColor? = nil){
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.text = text
        configure(with: fontStyle, fontSize: fontSize)
        
        if let color = textColor {
            self.textColor = color
        } else {
            self.textColor = .label
        }
        
    }
    
    private func configure(with fontStyle: FontStyle = .bold, fontSize: CGFloat = 16){
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        
        switch fontStyle {
        case .bold:
            font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        case .italic:
            font = UIFont.italicSystemFont(ofSize: fontSize)
        }
    }
    
}
