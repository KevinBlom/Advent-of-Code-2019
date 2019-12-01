//
//  main.swift
//  Advent of Code 2019
//
//  Created by Kevin Blom on 01/12/2019.
//  Copyright © 2019 Kevin Blom. All rights reserved.
//
//  --------------------------------------------------------------------------------------------
//
//  With a superthanks to dopiaza and his 2018 Advent of Code repository
//  for giving me a running start https://github.com/dopiaza/AdventOfCode2018
//
//  --------------------------------------------------------------------------------------------

import Foundation

let runAsTest = false
let day: Int = 1
let stage: Int = 2
let inputFile: String = "1"

let inputFilename: String = runAsTest ? inputFile : inputFile+"test"

print("Day: \(day), puzzle: \(stage), input file: \(inputFilename)"+".txt")
print("")
print("-----------------------------")
print("")

var puzzle: Puzzle!

switch day {
case 1:
    puzzle = AOC1(inputFile: inputFilename)
default:
    print("Cannot load puzzle for Day \(day)")
    exit(1)
}

var answer = "???"

switch stage {
case 1:
    answer = puzzle.runPuzzle1()
case 2:
    answer = puzzle.runPuzzle2()
default:
    print("Cannot find Stage \(stage) for Day \(day)")
    exit(1)
}


print("")
print("-----------------------------")
print("")
print("Answer: \(answer)")
print("")
print("-----------------------------")
print("")
