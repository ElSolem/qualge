package main

import "core:math"
import "core:fmt"

BigTan :: proc(x: int) -> f32 {
    return math.tan_f32(f32(x))
}

BigCos :: proc(x: int) -> f32 {
    return math.cos_f32(f32(x))
}

BigSin :: proc(x: int) -> f32 {
    return math.sin_f32(f32(x))
}

DoublePow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 2)
}

TriplePow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 3)
}

QuadPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 4)
}

PentaPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 5)
}

HexaPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 6)
}

SeptaPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 7)
}

OctaPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 8)
}

NonaPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 9)
}

TenPow :: proc(x: int) -> f64 {
    return f64(math.pow(f32(x), 10))
}

HalfPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 0.5)
}

ThirdPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 0.333)
}

FourthPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 0.25)
}

FifthPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 0.2)
}

SixthPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 0.166)
}

SeventhPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 0.142)
}

EighthPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 0.125)
}

NinthPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 0.111)
}

TenthPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 0.1)
}

WowPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), (1/137))
}

KingPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), (2/3))
}

Troolean :: enum {
    false = -1,
    nil = 0,
    true = 1,
}

troolean_not :: proc(t: Troolean) -> Troolean {
    switch t {
        case .false: return .true
        case .nil: return .nil
        case .true: return .false
    }
    return t
}

troolean_and :: proc(a, b: Troolean) -> Troolean {
    if a == .false || b == .false {
        return .false
    }
    if a == .nil || b == .nil {
        return .nil
    }
    return .true
}

troolean_or :: proc(a, b: Troolean) -> Troolean {
    if a == .true || b == .true {
        return .true
    }
    if a == .nil || b == .nil {
        return .nil
    }
    return .false
}

//Example of an Enumerated Array using Trooleans
//Future use can be within the logic of AI systems
//Works like a no hash map
TrooleanNames : [Troolean]string = {
    .false = "No",
    .nil   = "Maybe",
    .true  = "Yes",
}

get_troolean_by_name :: proc(name: string) -> Maybe(Troolean) {
    for k, v in TrooleanNames {
        if k == name {
            return v
        }
    }
    return nil // not found
}

main :: proc() {
    values := []Troolean{Troolean.false, Troolean.nil, Troolean.true}
    t := get_troolean_by_name("Yes"); // -> .true

    for v in values {
        result := troolean_not(v)
        output := troolean_and(v, result)
        outcome := troolean_or(v, result)
        fmt.printfln("Input: %v, NOT: %v, AND: %v, OR: %v", v, result, output, outcome)
    }
    fmt.printfln("Troolean Value: %v", t)
}