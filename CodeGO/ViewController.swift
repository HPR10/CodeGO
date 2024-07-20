//
//  ViewController.swift
//  CodeGO
//
//  Created by Hugo Pinheiro  on 19/07/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    // Criação do UILabel com configuração inicial
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Hello ViewCode"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Chamado após a view do controlador ter sido carregada na memória e apenas uma vez
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Configuração das views e constraints
        setupViews()
        setupConstraints()
    }
    
    // Adiciona subviews à hierarquia de visualização
    private func setupViews() {
        view.addSubview(label)
    }
    
    // Configura as constraints usando NSLayoutConstraint
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

#Preview {
    let vc = ViewController()
    return vc
}




