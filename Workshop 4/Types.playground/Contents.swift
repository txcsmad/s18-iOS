//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func SayHello(name: String) -> String {
        return "Hello \(name), I am \(self.name)"
    }
}

class Kid: Person {
    var school: String
    init(name: String, age: Int, school: String) {
        self.school = school
        super.init(name: name, age: age)
    }
    
    override func SayHello(name: String) -> String {
        return super.SayHello(name: name) + ", sir"
    }
}

var dave = Person(name: "Dave", age: 40)
dave.SayHello(name: "Jim")

var tim = Kid(name: "Tim", age: 10, school: "UT")
tim.SayHello(name: "Jim")




class Car {
    
    var brand = "Toyota Sienna"
    var maxSpeed = 150
    
    
}


var firstCar = Car()
print(firstCar.brand)


let secondCar = firstCar
secondCar.maxSpeed = 100

print(secondCar.maxSpeed)
print(firstCar.maxSpeed)

enum Direction: String {
    case north = "N"
    case south
    case east
    case west
}

var direction: Direction = .south

if direction == .south {
    print("The South is neutral.")
}

direction.rawValue.capitalized
let rawString = "N"
let newDirection = Direction(rawValue: rawString)

switch direction {
case .north, .south:
    print("North or South")
case .west, .east:
    print("West or East")
}

enum BookStatus {
    case checkedOut(Person)
    case available
}

let bookStatus = BookStatus.checkedOut(tim)

switch bookStatus {
case .checkedOut(let person):
    print("\(person.name) checked out the book")
default:
    break
}

enum Optional<T> {
    case some(T)
    case none
}

