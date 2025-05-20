package main

import "core:math"
import "core:math/rand"
import "core:time"
import "core:fmt"
import "core:mem"

quantum_transformer :: proc() -> bool {
    for y in 0..<10 {
        for x in 0..<10 {
            if y != 0 {
                if x*y == x/y || x*y != x/y {
                switch {
                    case x*y == x/y:
                        fmt.println("Polyrefractal")
                        fallthrough
                    case x*y != x/y:
                        fmt.println("Parallax")
                        fallthrough
                    case:
                        fmt.println("Other")
                        return true
                    }
                }
            }
        }
    }
    return true
}

/*
main :: proc() {
    quantum_transformer()
}*/