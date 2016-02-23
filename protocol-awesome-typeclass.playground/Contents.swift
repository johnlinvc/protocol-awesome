//: Playground - noun: a place where people can play

import UIKit

struct Ranking : Comparable {
    let rank:Int
}
func == (lhs:Ranking, rhs: Ranking) -> Bool {
    return lhs.rank == rhs.rank
}
func < (lhs:Ranking, rhs: Ranking) -> Bool {
    return lhs.rank < rhs.rank
}

Ranking(rank: 3) <= Ranking(rank: 4)
Ranking(rank: 3) > Ranking(rank: 4)
Ranking(rank: 3) != Ranking(rank: 4)


protocol Syncable {
    var serverPath:NSURLComponents{ get }
    var jsonValue:String { set get }
    mutating func reload()
    func update()
}

extension Syncable {
    func getFromPath(path:NSURLComponents) -> String {
        return "{\"id\":1,\"name\":\"John\"}"
    }
    func postPath(path: NSURLComponents) {
        print("posting to path:\(path)\n with data:\(jsonValue)")
    }
    mutating func reload() {
        let json = getFromPath(serverPath)
        jsonValue = json
    }
    func update() {
        postPath(serverPath)
    }
}

class User: Syncable, CustomStringConvertible {
    lazy var name:String = "no one"
    lazy var id:Int = 1
    var serverPath: NSURLComponents {
        get { return NSURLComponents(string: "http://localhost:3000/users/\(id)")! }
    }
    var jsonValue: String {
        get {
            return "{\"id\":\(id),\"name\":\"\(name)\"}"
        }
        set {
            print("setting json value to \(newValue)")
            //set the id & name from json string
        }
    }
    var description: String { get { return "\(name)" } }
}

var u = User()
u.reload()
u.name = "John"
u.update()
