package main

import "core:math"
import "core:math/rand"
import "core:time"
import "core:fmt"
import "core:mem"

quantum_condition :: proc() -> bool {
    // 
    for y in 0..<1_000_000_000 {
        for x in 0..<1_000_000_000 {
            if y != 0 {
                if ((x) == (0)) || ((y) == (0)) || ((x) == (x)) || ((x)==(y)) || ((y)==(y)) || ((x*x)==(0)) || ((x*y)==(0)) || ((y*y)==(0)) || ((x*x)== (x)) || ((x*x)==(y)) || ((x*y)==(x)) || ((x*y)==(y)) || ((y*y)==(x)) || ((y*y)==(y)) || ((x*x)==(x*x)) || ((x*x)==(x*y)) || ((x*x)==(y*y)) || ((x*y)==(x*y)) || ((x*y)==(y*y)) || ((y*y)==(x*y)) || ((y*y)==(y*y)) || ((x*x)==(x/y)) || ((x*y)==(x/y)) || ((y*y)==(x/y)) {
                    switch {
                        case x == 0:
                            fmt.println("x = 0")
                            fallthrough
                        case y == 0:
                            fmt.println("y = 0")
                            fallthrough
                        case x == x:
                            fmt.println("x = x")
                            fallthrough
                        case x == y:
                            fmt.println("x = y")
                            fallthrough
                        case y == y:
                            fmt.println("y = y")
                            fallthrough
                        case x*x == 0:
                            fmt.println("xx = 0")
                            fallthrough
                        case x*y == 0:
                            fmt.println("xy = 0")
                            fallthrough
                        case y*y == 0:
                            fmt.println("yy = 0")
                            fallthrough
                        case x*x == x:
                            fmt.println("xx = x")
                            fallthrough
                        case x*x == y:
                            fmt.println("xx = y")
                            fallthrough
                        case x*y == x:
                            fmt.println("xy = x")
                            fallthrough
                        case x*y == y:
                            fmt.println("xy = y")
                            fallthrough
                        case x*x == x*x:
                            fmt.println("xx = xx")
                            fallthrough
                        case x*x == x*y:
                            fmt.println("xx = xy")
                            fallthrough
                        case x*x == y*y:
                            fmt.println("xx = yy")
                            fallthrough
                        case x*y == x*y:
                            fmt.println("xy = xy")
                            fallthrough
                        case x*y == y*y:
                            fmt.println("xy = yy")
                            fallthrough
                        case y*y == y*y:
                            fmt.println("yy = yy")
                            fallthrough
                        case x*x == x/y:
                            fmt.println("xx = x/y")
                            fallthrough
                        case x*y == x/y:
                            fmt.println("xy = x/y")
                            fallthrough
                        case y*y == x/y:
                            fmt.println("yy = x/y")
                            fallthrough
                        case:
                            fmt.println("the end")
                            return true // return true/false = single loop print // fallthrough for multiloop print
                    }
                }
            }
        }
    }

    dx := 0.1
    dy := 1.2
    lhs := math.tan(f32(11111*dx)/f32(11111*dy))
    rhs := math.tan(f32(11111*dx) * f32(11111*dy))
    return abs(rhs - lhs) < 1e-5
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
    return nil // if not found
}

any_array :: proc() -> bool {
    array := [dynamic]any{69, true, 1.41, "sux", 'Z', nil, Troolean.false, Troolean.nil, Troolean.true}

    append(&array, 72)
    append(&array, "Music")

    for a in array {
        switch v in a {
            case int:
                fmt.println("Int", v)
            case bool:
                fmt.println("bool", v)
            case f64:
                fmt.println("f64", v)
            case rune:
                fmt.println("rune", v)
            case string:
                fmt.println("string", v)
            case:
                fmt.println("something", v)
            case Troolean:
                for t in Troolean {
                switch t {
                    case .true:
                        fmt.println("true")
                    case .false:
                        fmt.println("false")
                    case .nil:
                        fmt.println("nil")
                }
            }
        }
    }
    return true
}


main :: proc() {
    t0 := time.now()
    t := any_array()
    u := u16(Troolean.true)
    
    fmt.println("Hurray!", any_array)
    fmt.println("Testing T:", t)
    fmt.println("Testing U:", u)

    /*
    for y in 0..<11 {
        for x in 0..<10000 {
            if quantum_condition() {fmt.println(x, y)}
        }
    } */
    quantum_condition()

    t1 := time.now()
    dt := time.diff(t0, t1)

    fmt.printf("Time taken: %.2f seconds\n", dt)
    fmt.printf("Time taken: %.3f seconds\n", f64(dt) / f64(time.Millisecond) / 1000.0)
    fmt.printf("Time taken: %.3f ms\n", f64(dt) / f64(time.Millisecond))
}