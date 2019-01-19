//
//  TableView.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/19/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

class TableView: UITableView {
    
}

extension UITableView {
    
    // MARK: - Apperance
    // MARK: Registration
    
    func register<Cell: TableViewCell>(
        _ cell: Cell.Type,
        reuseIdentifier: String = String(describing: Cell.self)
    ) {
        self.register(cell, forCellReuseIdentifier: reuseIdentifier)
    }
    
    // MARK: Dequeue
    
    func dequeueCell<Cell: TableViewCell>(
        at indexPath: IndexPath,
        reuseIdentifier: String = String(describing: Cell.self),
        of type: Cell.Type = Cell.self
    ) -> Cell {
        return self.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! Cell
    }
    
}
