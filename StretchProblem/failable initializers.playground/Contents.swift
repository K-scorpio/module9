//: Playground - noun: a place where people can play

import UIKit

let workingDictionary = ["nameKey": "Derek", "ageKey": 28, "favMovie": "Zoolander"]
let brokenDictionary = ["nameKey": "Steve", "ageKey": 2]

class Person {
    
    let nameKey = "nameKey"
    let ageKey = "ageKey"
    let favMovieKey = "favMovie"
    
    let name: String
    var age: Int
    var favMovie: String
    
    init?(dictionary: [String: AnyObject]) {
        
        guard let name = dictionary[nameKey] as? String, let age = dictionary[ageKey] as? Int, let favMovie = dictionary[favMovieKey] as? String else {
            return nil
        }
        self.name = name
        self.age = age
        self.favMovie = favMovie
    }
}

if let person = Person(dictionary: workingDictionary) {

print(person.name)
    
}