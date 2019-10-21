//
//  SwiftGoodies.swift
//  KEX
//
//  Created by Daniel Schlaug on 6/10/14.
//  Copyright (c) 2014 Daniel Schlaug. All rights reserved.
//

import Foundation

/* Simple regex */
/* Thanks to http://vperi.com/2014/06/08/regular-expressions-in-switch-statements/ */
/* enables
    switch "some" {
    case ~/"\\w{4}":
        //Totally matches!!!
    }
*/
func ~=(pattern: NSRegularExpression, str: NSString) -> Bool {
    return pattern.numberOfMatchesInString(str as String, options: [], range: NSRange(location: 0,  length: str.length)) > 0
}

func ~=(str: NSString, pattern: NSRegularExpression) -> Bool {
    return pattern.numberOfMatchesInString(str as String, options: [], range: NSRange(location: 0,  length: str.length)) > 0
}

//func ><(str: String, replacer:(NSRegularExpression, String)) -> String {
//    let (pattern: NSRegularExpression, replacementTemplate: String) = replacer
//    return pattern.stringByReplacingMatchesInString(str, options: nil, range: str.fullRange, withTemplate: replacementTemplate)
//}

prefix operator ~/ {}

//infix operator >< {}

prefix func ~/(pattern: String) -> NSRegularExpression {
        return try! NSRegularExpression(pattern: pattern, options: [])
}

/* Substrings and characters */
extension String {
    subscript(index: Int) -> Character {
        get {
            assert(index > -1, "Index out of bounds")
            var i = 0
            
            for char in self.characters {
                if i == index {
                    return char
                }
                ++i
            }
            assert(false, "Index out of bounds")
            return "0"
        }
    }
    
    subscript(range: Range<Int>) -> String {
        get {
            assert(range.startIndex > -1, "Index out of bounds")
            var string = ""
            var i = 0
            for char in self.characters {
                if i >= range.startIndex && i <= range.endIndex {
                    string.append(char)
                }
                ++i
            }
            return string
        }
    }
    
    subscript(range: NSRange) -> String {
        get {
            let startIndex = range.startIndex
            let endIndex = range.endIndex
            return self[Range(start: startIndex, end: endIndex)]
        }
    }
   
    var fullRange: NSRange {
    return NSMakeRange(0, self.characters.count)
    }
    
    func stringByReplacingMatchesOfRegularExpression(pattern: NSRegularExpression, withTemplate template:String?) -> String {
        return pattern.stringByReplacingMatchesInString(self, options: [], range: self.fullRange, withTemplate: template!)
    }
    
    var doubleValue: Double {
        let legacyString = self as NSString
        return legacyString.doubleValue
    }
}

extension NSRange {
    var endIndex: Int {
        return self.location + self.length
    }
    
    var startIndex: Int {
        return self.location
    }
    
    init(range: Range<Int>) {
        location = range.startIndex
        length = range.endIndex - range.startIndex
    }
}