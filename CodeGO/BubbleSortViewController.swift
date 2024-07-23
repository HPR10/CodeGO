//
//  BubbleSortViewController.swift
//  CodeGO
//
//  Created by Hugo Pinheiro on 22/07/24.
//

import UIKit

class BubbleSortViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Bubble Sort"
        
        let label = UILabel()
        label.text = "Detalhes do Bubble Sort"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

#Preview {
    let vc = BubbleSortViewController()
    return vc
}
