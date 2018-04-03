//: Playground - noun: a place where people can play

import UIKit

// Today:
// 1. Error handling
// 2. Networking, REST APIs, and JSON parsing


enum VendingMachineError: Error {
    case outOfStock
    case insufficientFunds
}


struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    
    var inventory = [
        "Candy Bar": Item(price: 2, count: 5),
        "Juice Box": Item(price: 3, count: 10)
    ]
    
    var funds = 5
    
    func vend(itemNamed name: String) throws -> String {
        
        guard var item = inventory[name], item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= funds else {
            throw VendingMachineError.insufficientFunds
        }
        
        item.count -= 1
        funds -= item.price
        
        return name
    }
}


var vendingmachine = VendingMachine()

do {
    try vendingmachine.vend(itemNamed: "oreos")
} catch {
    print(error)
}

let x = try? vendingmachine.vend(itemNamed: "soylent")
print(x)

let y = try! vendingmachine.vend(itemNamed: "Candy Bar")
print(y)








