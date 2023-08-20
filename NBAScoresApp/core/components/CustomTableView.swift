//
//  CustomTableView.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 10/08/23.
//

import UIKit

protocol ReusableCell: UITableViewCell {
    static var reuseID: String { get }
}

class CustomTableView<CellType: ReusableCell>: UITableView {
    
    private let customRowHeight: CGFloat
    
    init(frame: CGRect, style: UITableView.Style, rowHeight: CGFloat) {
        self.customRowHeight = rowHeight
        super.init(frame: frame, style: style)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        separatorStyle = .none
        allowsSelection = false
        rowHeight = customRowHeight
        register(CellType.self, forCellReuseIdentifier: CellType.reuseID)
        translatesAutoresizingMaskIntoConstraints = false
    }
}


