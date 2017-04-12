//
//  Counter.swift
//  EXCERCISE
//
//  Created by Christopher Fonseka on 04/03/2017.
//  Copyright © 2017 ChristopherFonseka. All rights reserved.
//

import Foundation

struct Counter
{
    let reps: Int

    private var currentStep = 0
    private var currentRep  = 1


    init(reps: Int)
    {
        self.reps = reps
    }

    mutating func next() -> Int?
    {
        if (incrementStep())
        {
            return currentStep
        }
        else
        {
            if (incrementRep())
            {
                return currentRep
            }
        }
        return nil
    }

    private mutating func incrementStep() -> Bool
    {
        currentStep = currentStep + 1

        if (currentStep >= 10)
        {
            currentStep = 1
            return false
        }

        return true
    }

    private mutating func incrementRep() -> Bool
    {
        currentRep = currentRep + 1
        return (currentRep <= reps)
    }
}
