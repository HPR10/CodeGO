import UIKit
import SwiftUI

class BubbleSortViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "O Bubble Sort é um algoritmo simples que ordena uma lista comparando e trocando elementos adjacentes. Ele percorre a lista várias vezes, trocando elementos fora de ordem, até que toda a lista esteja ordenada."
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var hostingController: UIHostingController<BubbleSortView>?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Bubble Sort"
        
        view.addSubview(label)
        layoutConstraints()
        
        // View SwiftUI
        let bubbleSortView = BubbleSortView()
        hostingController = UIHostingController(rootView: bubbleSortView)
        
        guard let hostingController = hostingController else { return }
        
        // Adicionando a visualização do hostingController como filho
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: label.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

#Preview {
    let vc = BubbleSortViewController()
    return vc
}
