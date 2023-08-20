//
//  LoaderView.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 10/08/23.
//

import UIKit

class LoaderView: UIView {

    private let loader = UIActivityIndicatorView(style: .large)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLoader()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureLoader() {
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
        loader.color = .white
        loader.translatesAutoresizingMaskIntoConstraints = false
        addSubview(loader)

        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func addToView(_ parentView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(self)

        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: parentView.trailingAnchor),
            self.topAnchor.constraint(equalTo: parentView.topAnchor),
            self.bottomAnchor.constraint(equalTo: parentView.bottomAnchor)
        ])
    }

    func show() {
        DispatchQueue.main.async {
            self.loader.startAnimating()
            self.isHidden = false
            self.superview?.bringSubviewToFront(self)
        }
    }

    func hide() {
        DispatchQueue.main.async {
            self.loader.stopAnimating()
            self.isHidden = true
        }
    }
}

