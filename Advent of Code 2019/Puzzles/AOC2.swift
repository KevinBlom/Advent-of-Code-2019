//
//  AOC2.swift
//  Advent of Code 2019
//
//  Created by Kevin Blom on 02/12/2019.
//  Copyright © 2019 Kevin Blom. All rights reserved.
//

import Foundation

class AOC2: Puzzle {
    
    let inputFile: String
    
    init(inputFile: String) {
        self.inputFile = inputFile
    }
    
    func runPuzzle1() -> String {
        let reader = InputReader(input: inputFile)
        let opcodes = reader.toString()
        
        // From a single string, create an array of opcode numbers so we can work on it using indices
        var opcodeArray = opcodes.split(separator: ",").map { Int($0)! }
        print ("\(opcodeArray.count) lines read")
        
        // Opcode read position. Shifts 4 after every succesful instruction.
        var position: Int = 0
        var value: Int = 0
        
        // As per the assignement, the opcodes for position 1 and 2 should be changed
        opcodeArray[1] = 12
        opcodeArray[2] = 2
        
        // Opcode value 99 means stop executing the opcodes.
        while(value != 99) {
            
            // First we grab the input positions. These are just positions, not the the values for addition or multiplication
            let firstInputPosition = opcodeArray[position+1]
            let secondInputPosition = opcodeArray[position+2]
            
            // Inputs is the actual values we are going to process (add or multiply)
            let inputs: [Int] = [opcodeArray[firstInputPosition], opcodeArray[secondInputPosition]]
            
            // Output position is where we are going to store the result of the operation
            let outputPosition: Int = opcodeArray[position+3]
            
            switch opcodeArray[position] {
            case 1:
                opcodeArray[outputPosition] = inputs[0] + inputs[1]
            case 2:
                opcodeArray[outputPosition] = inputs[0] * inputs[1]
            default:
                print("Unknown opcode encountered")
                break
            }
            
            // If all goes well, we can advance to the next opcode
            position += 4
            value = opcodeArray[position]
        }
        
        return String(opcodeArray[0])
    }
    
    func runPuzzle2() -> String {
        let reader = InputReader(input: inputFile)
        let opcodes = reader.toString()
        
        // From a single string, create an array of opcode numbers so we can work on it using indices
        var opcodeArray = opcodes.split(separator: ",").map { Int($0)! }
        let opcodeArrayOriginal = opcodeArray
        print ("\(opcodeArray.count) lines read")
        
        // Opcode read position. Shifts 4 after every succesful instruction.
        var position: Int = 0
        var value: Int = 0
        
        for noun in 0...99 {
            for verb in 0...99 {
                
                // Reset position and value, we need to work from the start every run
                position = 0
                value = 0
                
                // So we also reset the array to the original values
                opcodeArray = opcodeArrayOriginal
                
                // As per the assignment, we set parameters 1 and 2 to the noun and the verb.
                opcodeArray[1] = noun
                opcodeArray[2] = verb
                
                // Opcode value 99 means stop executing the opcodes.
                while(value != 99) {
                    // First we grab the input positions. These are just positions, not the the values for addition or multiplication
                    let firstInputPosition = opcodeArray[position+1]
                    let secondInputPosition = opcodeArray[position+2]
                    
                    // Inputs is the actual values we are going to process (add or multiply)
                    let inputs: [Int] = [opcodeArray[firstInputPosition], opcodeArray[secondInputPosition]]
                    
                    // Output position is where we are going to store the result of the operation
                    let outputPosition: Int = opcodeArray[position+3]
                    
                    switch opcodeArray[position] {
                    case 1:
                        opcodeArray[outputPosition] = inputs[0] + inputs[1]
                    case 2:
                        opcodeArray[outputPosition] = inputs[0] * inputs[1]
                    default:
                        print("Unknown opcode encountered")
                        break
                    }
                    
                    // If all goes well, we can advance to the next opcode
                    position += 4
                    value = opcodeArray[position]
                }
                
                // The solution is reached when noun and verb produce the date of the moonlanding ;)
                if(opcodeArray[0] == 19690720) {
                    return("Solution: \(noun), \(verb)")
                }
            }
        }
        
        return "No answer"
    }
    
}
