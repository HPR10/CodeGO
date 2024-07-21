//
//  SplashScreenViewController.swift
//  CodeGO
//
//  Created by Hugo Pinheiro  on 21/07/24.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    private let splashLabel: UILabel = {
        let label = UILabel()
        label.text = "CodeGO"
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.5, alpha: 1.0)
        
        view.addSubview(splashLabel)
        
        setupConstraints()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
                  self?.showNextViewController()
              }
        }
    
    private func setupConstraints() {
           NSLayoutConstraint.activate([
               splashLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               splashLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
           ])
       }
    
    private func showNextViewController() {
        let contentViewController = ViewController()
        contentViewController.modalPresentationStyle = .fullScreen
        self.present(contentViewController, animated: true, completion: nil)
        }
    }


#Preview {
    let vc = SplashScreenViewController()
    return vc
}


    

