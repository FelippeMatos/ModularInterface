//
//  ViewController.swift
//  App
//
//  Created by Felippe Matos Francoski on 01/06/20.
//  Copyright © 2020 Felippe Matos Francoski. All rights reserved.
//

import UIKit
import AppComponents

class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Categorias de investimento"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Service.investments.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let component = createComponent(with: Service.investments[indexPath.row])
        component.pinToBounds(of: cell)
        return cell
    }
    
    private func createComponent(with investment: Investment) -> CardComponent {
        let component: CardComponent = UIView.componentFromNib()
        let dto = CardComponent.DTO(title: investment.name, content: investment.description, isFavorite: false)
        component.render(.build(dto))
        return component
    }
}
