//
//  AOC3.swift
//  Advent of Code 2019
//
//  Created by Kevin Blom on 03/12/2019.
//  Copyright © 2019 Kevin Blom. All rights reserved.
//

import Foundation

class AOC3: Puzzle {
    
    let inputFile: String
    
    init(inputFile: String) {
        self.inputFile = inputFile
    }
    
    func runPuzzle1() -> String {
        let reader: InputReader = InputReader(input: inputFile)
        let wirePaths: [String] = reader.toStringArray()
        print ("\(wirePaths.count) lines read")
        
        // The paths are the two elements in the input array, so I seperate them into their own arrays for processing
        let pathInstructions1: [String] = wirePaths[0].split(separator: ",").map { String($0) }
        let pathInstructions2: [String] = wirePaths[1].split(separator: ",").map { String($0) }
        
        // I will store an array of all steps we take along the path, later I can compare these to see if there are coordinates that are the same.
        let path1: Set<Coordinate> = processPathInstructions(instructions: pathInstructions1)
        let path2: Set<Coordinate> = processPathInstructions(instructions: pathInstructions2)
        
        // Let's create an array of coordinates where we will store intersection locations for later
        let intersections: Set<Coordinate> = path1.intersection(path2)
        let intersectionDistancesToOrigin: [Int] = intersections.map { manhattanDistance(to: $0) }
        let closestIntersectionDistance: Int = intersectionDistancesToOrigin.min()!
        
        return String(closestIntersectionDistance)
    }
    
    func runPuzzle2() -> String {
        let reader: InputReader = InputReader(input: inputFile)
        let wirePaths: [String] = reader.toStringArray()
        print ("\(wirePaths.count) lines read")
        
        // The paths are the two elements in the input array, so I seperate them into their own arrays for processing
        let pathInstructions1: [String] = wirePaths[0].split(separator: ",").map { String($0) }
        let pathInstructions2: [String] = wirePaths[1].split(separator: ",").map { String($0) }
        
        // I will store an array of all steps we take along the path, later I can compare these to see if there are coordinates that are the same.
        let path1: Set<Coordinate> = processPathInstructions(instructions: pathInstructions1)
        let path2: Set<Coordinate> = processPathInstructions(instructions: pathInstructions2)
        
        // Let's create an array of coordinates where we will store intersection locations for later
        let intersections: Set<Coordinate> = path1.intersection(path2)
        
        //let intersectionDistancesToOrigin: [Int] = intersections.map { manhattanDistance(to: $0) }
        //et closestIntersectionDistance: Int = intersectionDistancesToOrigin.min()!
        
        return "No answer"

    }
    
    func processPathInstructions(instructions: [String]) -> Set<Coordinate> {
        var origin = Coordinate(x: 0,y: 0)
        var path: Set<Coordinate> = Set<Coordinate>()
        
        for instruction in instructions {
            let step = seperateInstruction(instruction: instruction)
            
            switch step.direction {
            case "U":
                for n in 1...step.distance {
                    // When direction is up, the X coordinate stays the same, and the Y coordinate will increase
                    path.insert(Coordinate(x: origin.x, y: origin.y + n))
                }
                origin = Coordinate(x: origin.x, y: origin.y + step.distance)
            case "D":
                for n in 1...step.distance {
                    // When direction is down, the X coordinate stays the same, and the Y coordinate will decrease
                    path.insert(Coordinate(x: origin.x, y: origin.y - n))
                }
                origin = Coordinate(x: origin.x, y: origin.y - step.distance)
            case "R":
                for n in 1...step.distance {
                    // When direction is right, the Y coordinate stays the same, and the X coordinate will increase
                    path.insert(Coordinate(x: origin.x + n, y: origin.y))
                }
                origin = Coordinate(x: origin.x + step.distance, y: origin.y)
            case "L":
                for n in 1...step.distance {
                    // When direction is right, the Y coordinate stays the same, and the X coordinate will decrease
                    path.insert(Coordinate(x: origin.x - n, y: origin.y))
                }
                origin = Coordinate(x: origin.x - step.distance, y: origin.y)
            default:
                print("Unknown direction found")
                break
            }
        }
        return path
    }
    
    func seperateInstruction(instruction: String) -> Instruction {
        
        var _instruction: String = instruction
        
        // The direction is the first letter in the String, always.
        let direction: Character = _instruction.first!
        
        // Now remove the first letter and save the distance as an Int
        _instruction.remove(at: _instruction.startIndex)
        let distance: Int = Int(_instruction)!
        return Instruction(direction: direction, distance: distance)
    }
    
    func manhattanDistance(to: Coordinate) -> Int {
        let from = Coordinate(x: 0,y: 0) // We always search from origin
        return (abs(from.x - to.x) + abs(from.y - to.y))
    }
    
}

struct Instruction {
    let direction: Character
    let distance: Int
}

struct Coordinate: Hashable, CustomStringConvertible, Equatable {
    
    static func == (lhs: Coordinate, rhs: Coordinate) -> Bool {
        return (lhs.x == rhs.x) && (lhs.y == rhs.y)
    }
    
    let x: Int
    let y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    var description : String {
        get {
            return "x: \(x), y: \(y)\n"
        }
    }
}
