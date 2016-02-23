//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
struct User: CustomStringConvertible {
    let firstName:String
    let lastName:String
    var description: String {
        get {
            return "\(firstName) \(lastName)"
        }
    }
}
struct Post : CustomStringConvertible, CustomDebugStringConvertible {
    let title:String
    let content:String
    var description: String {
        get {
            return "\(title)\n\(content)"
        }
    }
    var debugDescription: String {
        return "\(title)"
    }
}
class SuperTextView: UITextView {
    func append2(any: CustomStringConvertible){
        text.appendContentsOf("\(String(any))\n")
    }
    func append(s:String) {
        text.appendContentsOf("\(s)\n")
    }
    func append(u:User) {
        text.appendContentsOf("\(u.firstName) \(u.lastName)\n")
    }
    func append(p:Post) {
        text.appendContentsOf("\(p.title)\n\(p.content)\n")
    }
}

let user = User(firstName: "John", lastName: "Lin")
let post = Post(title: "hello", content: "world")
let superTextView = SuperTextView()
superTextView.font = UIFont(name: "helvetica", size: 36)
superTextView.append("Hello world")
superTextView.append(user)
superTextView.append(post)
superTextView.append2("\n")
superTextView.append2("New")
superTextView.append2(user)
superTextView.append2(post)
let vc = UIViewController()
XCPlaygroundPage.currentPage.liveView = vc
vc.view.addSubview(superTextView)
superTextView.frame = vc.view.frame


class Logger {
    func log<T>(obj:T) {
        print(String(obj))
    }
    func log<T:CustomDebugStringConvertible>(obj:T) {
        print(obj.debugDescription)
    }
}

let logger = Logger()
logger.log(user)
logger.log(post)

String(5)
String(2.333)
