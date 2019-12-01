//
//  AOC1.swift
//  AOC2018
//
//  Created by David Wilkinson on 05/12/2018.
//  Copyright © 2018 dopiaza.org. All rights reserved.
//

import Foundation

class AOC1: Puzzle {
    
    let inputFile: String
    
    init(inputFile: String) {
        self.inputFile = inputFile
    }
    
    func runPuzzle1() -> String {
        let reader = InputReader(input: inputFile)
        let massPerModule = reader.toStringArray()
        print ("\(massPerModule.count) lines read")
        
        // Data is read as String, so let's convert it to a number.
        // I use double since we will be dividing by 3 later and this might yield fractions
        let massPerModuleAsNumber = massPerModule.map { Double($0)! }
        let fuelPerModule = massPerModuleAsNumber.map {
            floor($0/3)-2
        }
        
        let totalFuel = fuelPerModule.reduce(0, { x, y in
            x+y
        })
        
        return String(totalFuel)
    }
    
    func runPuzzle2() -> String {
        let reader = InputReader(input: inputFile)
        let massPerModule = reader.toStringArray()
        print ("\(massPerModule.count) lines read")
        
        // Data is read as String, so let's convert it to a number.
        // I use double since we will be dividing by 3 later and this might yield fractions
        let massPerModuleAsNumber = massPerModule.map { Double($0)! }
        let fuelPerModule = massPerModuleAsNumber.map { totalFuelForModule(initialMass: $0) }
        
        let totalFuel = fuelPerModule.reduce(0, { x, y in
            x+y
        })
        
        return String(totalFuel)
    }
    
    func totalFuelForModule(initialMass: Double) -> Double {
        var remainingMass = initialMass
        var totalFuel = 0.0
        
        while(remainingMass > 0) {
            remainingMass = floor(remainingMass/3)-2.0

            if remainingMass > 0 {
                totalFuel += remainingMass
            }
        }
        return totalFuel
    }
}
