//
//  ViewController.swift
//  CodeGO
//
//  Created by Hugo Pinheiro on 19/07/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    let algorithms = ["Bubble Sort", "Quick Sort", "Merge Sort"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        setupConstraints()
    }
    
    func setupView() {
        view.backgroundColor = .white

        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor.systemGray6
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .darkGray
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    // MARK: - UITableViewDelegate & UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return algorithms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = algorithms[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedAlgorithm = algorithms[indexPath.row]
        if selectedAlgorithm == "Bubble Sort" {
            let bubbleSortViewController = BubbleSortViewController()
            navigationController?.pushViewController(bubbleSortViewController, animated: true)
        } else {
            print("Selected algorithm: \(selectedAlgorithm)")
        }
    }
}

#Preview {
    let vc = ViewController()
    return vc
}
