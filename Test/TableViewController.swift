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

    mutating func toggle() {
        self = self == .hidden ? .visible : .hidden
    }
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

        return cell
    }
}

// MARK: - UITableViewDelegate

extension TableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        objects[indexPath.row].state.toggle()

        tableView.reloadRows(at: [indexPath], with: .fade)
    }

}
