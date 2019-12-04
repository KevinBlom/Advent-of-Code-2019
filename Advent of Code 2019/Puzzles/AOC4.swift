//
//  AOC4.swift
//  Advent of Code 2019
//
//  Created by Kevin Blom on 04/12/2019.
//  Copyright © 2019 Kevin Blom. All rights reserved.
//

import Foundation

class AOC4: Puzzle {
    let inputFile: String
    
    let startPassword: Int = 387638
    let endPassword: Int = 919123
    
    init(inputFile: String) {
        self.inputFile = inputFile
    }
    
    func runPuzzle1() -> String {
        var correctPasswords: [Int] = []
        
        for password in startPassword...endPassword {
            if (password.containsSimilarAdjecentDigits && password.isNeverDecreasing) {
                correctPasswords.append(password)
            }
        }
        
        return String(correctPasswords.count)
    }
    
    func runPuzzle2() -> String {
        return "No answer"
    }
    
    func containsSimilarAdjecentDigits(_ password: Int) -> Bool {
        let digits = password.digits
        
        // Sliding window of size 2, so accounting for zero indexed array (-1) and
        // we only need to loop to second-to-last number (-1) we loop to digits.count-2
        for i in 0...(digits.count-2) {
            let lhs: Int = digits[i]
            let rhs: Int = digits[i+1]
            if (lhs == rhs) {
                return true
            }
        }
        return false
    }
}

extension BinaryInteger{
    
    var digits: [Int] {
        // Take the absolute, we are interested in the digits, not the negative/positive
        var number: Int = abs(Int(self))
        var digits: [Int] = []
        
        while number > 0 {
            digits.insert(number % 10, at: 0)
            number /= 10
        }
        
        return digits
    }
    
    var containsSimilarAdjecentDigits: Bool {
        let digits: [Int] = self.digits
        
        // If there are less than two digits we have nothing to compare
        // This also means the number does not contain similar adjecent digits
        if (digits.count > 2) {
            
            // Sliding window of size 2, so accounting for zero indexed array (-1) and
            // we only need to loop to second-to-last number (-1) we loop to digits.count-2
            for i in 0...(digits.count-2) {
                let lhs: Int = digits[i]
                let rhs: Int = digits[i+1]
                if (lhs == rhs) {
                    return true
                }
            }
        }
        return false
    }
    
    var isNeverDecreasing: Bool {
        let digits: [Int] = self.digits
        
        if (digits.count > 2) {
            for i in 0...(digits.count-2) {
                let lhs: Int = digits[i]
                let rhs: Int = digits[i+1]
                
                if (lhs > rhs) {
                    return false
                }
            }
        }
        return true
    }
}
