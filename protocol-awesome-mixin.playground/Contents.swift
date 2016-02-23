//: Playground - noun: a place where people can play

import UIKit

protocol Loginable {
    func showLogin()
    var currentUser:User { get }
}

extension Int {
    func next() -> Int {
        return self + 1
    }
}

2.next()

struct User {
    lazy var id:Int = 1
}

extension Loginable {
    func showLogin() {
        print("called from \(self):please input username & password")
    }
    var currentUser:User { get { return User() } }
}

class LoginView: UIViewController, Loginable {
    
}

extension UITableViewController : Loginable { }
class CustomTableViewController : UITableViewController {
    
}
class LoginButton : UIButton, Loginable { }

extension Int : Loginable {}

let lv = LoginView()
lv.showLogin()
lv.currentUser

CustomTableViewController().showLogin()

let lb = LoginButton()
lb.showLogin()


5.showLogin()
