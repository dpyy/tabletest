//
//  TableViewController.swift
//  Test
//
//  Created by Gary Fung on 2020-01-29.
//  Copyright © 2020 Gary Fung. All rights reserved.
//

import UIKit

enum HiddenState {
    case hidden
    case visible
    case hiding
    case unhiding
}

struct MyObject {
    var state: HiddenState
}

class TableViewController: UITableViewController {

    var objects = (0..<25).map { _ in MyObject(state: .visible) }

}

// MARK: - UITableViewDataSource

extension TableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        let state = objects[indexPath.row].state

        cell.configure(for: state)

        switch state {
        case .hiding: objects[indexPath.row].state = .hidden
        case .unhiding: objects[indexPath.row].state = .visible
        default: break
        }

        return cell
    }
}

// MARK: - UITableViewDelegate

extension TableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch objects[indexPath.row].state {
        case .hidden, .hiding:
            objects[indexPath.row].state = .unhiding

        case .visible, .unhiding:
            objects[indexPath.row].state = .hiding
        }

        tableView.reloadRows(at: [indexPath], with: .fade)
    }

}
