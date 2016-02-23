//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
var str = "Hello, playground"

class LiveTableSource:NSObject, UITableViewDataSource {
    
    lazy var items:[String] = ["a","b","c"]
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let ident = "cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(ident) ?? UITableViewCell(style: .Default, reuseIdentifier: ident)
        let item = items[indexPath.row]
        cell.textLabel?.text = item
        return cell
    }
}

var tableVC = UITableViewController(style: .Plain)
var ltc = LiveTableSource()
tableVC.tableView.dataSource = ltc
XCPlaygroundPage.currentPage.liveView = tableVC
