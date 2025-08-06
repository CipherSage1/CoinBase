//
//  TableView.swift
//  CoinBase
//
//  Created by fin on 05/08/2025.
//

import SwiftUI
import UIKit

struct TableView: UIViewControllerRepresentable {
    var coins: [Coin]
    var onCoinSelected: (String) -> Void
    var onSwipeLeft: (Coin) -> Void
    var headerView: AnyView? = nil
    
    func makeCoordinator() -> Coordinator {
        Coordinator(coins: coins, onCoinSelected: onCoinSelected)
    }
    
    func makeUIViewController(context: Context) -> UITableViewController {
        let tableVC = UITableViewController()
        tableVC.tableView.register(HostingCell.self, forCellReuseIdentifier: "HostingCell")
        tableVC.tableView.dataSource = context.coordinator
        tableVC.tableView.delegate = context.coordinator
        tableVC.tableView.rowHeight = UITableView.automaticDimension
        tableVC.tableView.estimatedRowHeight = 80
        tableVC.tableView.alwaysBounceVertical = true
        tableVC.tableView.isScrollEnabled = true
        tableVC.view.backgroundColor = .clear
        
        
        if let headerView = headerView {
            let hostingController = UIHostingController(rootView: headerView)
            hostingController.view.translatesAutoresizingMaskIntoConstraints = false
            hostingController.view.backgroundColor = .clear
            
            tableVC.addChild(hostingController)
            tableVC.tableView.tableHeaderView = hostingController.view
            hostingController.didMove(toParent: tableVC)
            
            // Force layout after it's added to the hierarchy
            DispatchQueue.main.async {
                hostingController.view.setNeedsLayout()
                hostingController.view.layoutIfNeeded()
                
                let targetSize = CGSize(width: UIScreen.main.bounds.width, height: UIView.layoutFittingCompressedSize.height)
                let height = hostingController.view.systemLayoutSizeFitting(targetSize).height
                hostingController.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: height)
                tableVC.tableView.tableHeaderView = hostingController.view
            }
        }
        
        return tableVC
    }
    
    func updateUIViewController(_ uiViewController: UITableViewController, context: Context) {
        context.coordinator.coins = coins
        context.coordinator.onCoinSelected = onCoinSelected
        context.coordinator.onSwipeLeft = onSwipeLeft
        uiViewController.tableView.reloadData()
    }
    
    class Coordinator: NSObject, UITableViewDataSource, UITableViewDelegate {
        var coins: [Coin]
        var onCoinSelected: (String) -> Void
        var onSwipeLeft: ((Coin) -> Void)?
        
        init(coins: [Coin], onCoinSelected: @escaping (String) -> Void, onSwipeLeft: ((Coin) -> Void)? = nil) {
            self.coins = coins
            self.onCoinSelected = onCoinSelected
            self.onSwipeLeft = onSwipeLeft
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            coins.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let coin = coins[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "HostingCell", for: indexPath) as! HostingCell
            
            cell.host(
                CoinListItem(coin: coin)
                    .padding(.horizontal)
            )
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            let coin = coins[indexPath.row]
            onCoinSelected(coin.uuid)
        }
        
        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let coin = coins[indexPath.row]
            
            let favoriteAction = UIContextualAction(style: .normal, title: "Favorite") { [weak self] (action, view, completionHandler) in
                self?.onSwipeLeft?(coin)
                completionHandler(true)
            }
            
            favoriteAction.backgroundColor = UIColor.secondary
            favoriteAction.image = UIImage(systemName: "heart.fill")
            
            let configuration = UISwipeActionsConfiguration(actions: [favoriteAction])
            configuration.performsFirstActionWithFullSwipe = false
            return configuration
        }
    }
    
    class HostingCell: UITableViewCell {
        private var hostingController: UIHostingController<AnyView>?
        
        func host<Content: View>(_ view: Content) {
            if let controller = hostingController {
                controller.rootView = AnyView(view)
            } else {
                let controller = UIHostingController(rootView: AnyView(view))
                hostingController = controller
                controller.view.backgroundColor = .clear
                controller.view.translatesAutoresizingMaskIntoConstraints = false
                contentView.addSubview(controller.view)
                
                NSLayoutConstraint.activate([
                    controller.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                    controller.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                    controller.view.topAnchor.constraint(equalTo: contentView.topAnchor),
                    controller.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
                ])
            }
        }
    }
}
