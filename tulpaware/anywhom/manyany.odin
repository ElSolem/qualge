#+feature dynamic-literals
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

// Cos series
Coszero := math.cos_f64(.0)
Cosone := math.cos_f64(.1)
Cosnine := math.cos_f64(.9)

// Sin series
Sinzero := math.sin_f64(.0)
Sinone := math.sin_f64(.1)
Sinnine := math.sin_f64(.9)

// Tan series
Tanzero := math.tan_f64(.0)
Tanone := math.tan_f64(.1)
Tannine := math.tan_f64(.9)

// Quine Test
Quaquine :: proc() -> any {
    for x in 1..=100_000_000 {
        x := f64(x)
        xaxis := math.cos_f64(x)
        yaxis := math.sin_f64(x)
        zaxis := math.tan_f64(x)

        if xaxis == Cosone || xaxis != Cosone || xaxis == Coszero || xaxis != Coszero || xaxis == Cosnine || xaxis != Cosnine {
            if yaxis == Sinone || yaxis != Sinone || yaxis == Sinzero || yaxis != Sinzero || yaxis == Sinnine || yaxis != Sinnine {
                if yaxis == Tanone || yaxis != Tanone || yaxis == Tanzero || yaxis != Tanzero || yaxis == Tannine || yaxis != Tannine {
                }
            }
        }
    }
    return Quaquine
}

Quaquine1 :: proc() -> (any, any, any, any, any, any, any, any, any, any, any, any, any, any, any, any, any, any, any, any, any) {
    for x in 1..=100_000_000 {
        x := f64(x)
        xaxis := math.cos_f64(x)
        yaxis := math.sin_f64(x)
        zaxis := math.tan_f64(x)

        if xaxis == Cosone || xaxis != Cosone || xaxis == Coszero || xaxis != Coszero || xaxis == Cosnine || xaxis != Cosnine {
            if yaxis == Sinone || yaxis != Sinone || yaxis == Sinzero || yaxis != Sinzero || yaxis == Sinnine || yaxis != Sinnine {
                if yaxis == Tanone || yaxis != Tanone || yaxis == Tanzero || yaxis != Tanzero || yaxis == Tannine || yaxis != Tannine {
                }
            }
        }
    }
    xarray := [5]int{1, 2, 3, 4, 5}
    xslice := xarray[:]
    xdyn: [dynamic]int
    append(&xdyn, 123)
    append(&xdyn, 4, 1, 74, 3)
    Direction :: enum{North, East, South, West}
    Direction_Vectors :: [Direction][2]int {
	.North = {  0, -1 },
	.East = { +1,  0 },
	.South = {  0, +1 },
	.West = { -1,  0 },
    }
    Direction_Set :: bit_set[Direction]
    i := 123
    ptr := &i
    Vector2 :: struct {
	x: f32,
	y: f32,
    }
    vec := Vector2{1, 2}
    Value :: union {
	bool,
	i32,
	f32,
	string,
    }
    val: Value
    val = "Hellope"
    s1, ok := val.(string)
    mapy := make(map[string]int)
    defer delete(mapy)
    mapy["Bob"] = 2
    compl: complex64 = 1
    quat :quaternion64 = 1

    return 0x6f6f, true, false, nil, 0, 1.2, 'A', "This is bananas", compl, quat, xarray, xslice, xdyn, Direction.East, Direction_Vectors, Direction_Set.North, ptr, vec, val, s1, mapy
}

Quaquine2 :: proc() -> any {
    for x in 1..=100_000_000 {
        x := f64(x)
        xaxis := math.cos_f64(x)
        yaxis := math.sin_f64(x)
        zaxis := math.tan_f64(x)

        if xaxis == Cosone || xaxis != Cosone || xaxis == Coszero || xaxis != Coszero || xaxis == Cosnine || xaxis != Cosnine {
            if yaxis == Sinone || yaxis != Sinone || yaxis == Sinzero || yaxis != Sinzero || yaxis == Sinnine || yaxis != Sinnine {
                if yaxis == Tanone || yaxis != Tanone || yaxis == Tanzero || yaxis != Tanzero || yaxis == Tannine || yaxis != Tannine {
                }
            }
        }
    }
    return 0x7f7f
}

Quaquine3 :: proc() -> any {
    for x in 1..=100_000_000 {
        x := f64(x)
        xaxis := math.cos_f64(x)
        yaxis := math.sin_f64(x)
        zaxis := math.tan_f64(x)

        if xaxis == Cosone || xaxis != Cosone || xaxis == Coszero || xaxis != Coszero || xaxis == Cosnine || xaxis != Cosnine {
            if yaxis == Sinone || yaxis != Sinone || yaxis == Sinzero || yaxis != Sinzero || yaxis == Sinnine || yaxis != Sinnine {
                if yaxis == Tanone || yaxis != Tanone || yaxis == Tanzero || yaxis != Tanzero || yaxis == Tannine || yaxis != Tannine {
                }
            }
        }
    }
    return 1.2
}

Quaquine4 :: proc() -> any {
    for x in 1..=100_000_000 {
        x := f64(x)
        xaxis := math.cos_f64(x)
        yaxis := math.sin_f64(x)
        zaxis := math.tan_f64(x)

        if xaxis == Cosone || xaxis != Cosone || xaxis == Coszero || xaxis != Coszero || xaxis == Cosnine || xaxis != Cosnine {
            if yaxis == Sinone || yaxis != Sinone || yaxis == Sinzero || yaxis != Sinzero || yaxis == Sinnine || yaxis != Sinnine {
                if yaxis == Tanone || yaxis != Tanone || yaxis == Tanzero || yaxis != Tanzero || yaxis == Tannine || yaxis != Tannine {
                }
            }
        }
    }
    return 'A'
}

Quaquine5 :: proc() -> any {
    for x in 1..=100_000_000 {
        x := f64(x)
        xaxis := math.cos_f64(x)
        yaxis := math.sin_f64(x)
        zaxis := math.tan_f64(x)

        if xaxis == Cosone || xaxis != Cosone || xaxis == Coszero || xaxis != Coszero || xaxis == Cosnine || xaxis != Cosnine {
            if yaxis == Sinone || yaxis != Sinone || yaxis == Sinzero || yaxis != Sinzero || yaxis == Sinnine || yaxis != Sinnine {
                if yaxis == Tanone || yaxis != Tanone || yaxis == Tanzero || yaxis != Tanzero || yaxis == Tannine || yaxis != Tannine {
                }
            }
        }
    }
    return "This is bananas"
}

Quaquine6 :: proc() -> any {
    for x in 1..=100_000_000 {
        x := f64(x)
        xaxis := math.cos_f64(x)
        yaxis := math.sin_f64(x)
        zaxis := math.tan_f64(x)

        if xaxis == Cosone || xaxis != Cosone || xaxis == Coszero || xaxis != Coszero || xaxis == Cosnine || xaxis != Cosnine {
            if yaxis == Sinone || yaxis != Sinone || yaxis == Sinzero || yaxis != Sinzero || yaxis == Sinnine || yaxis != Sinnine {
                if yaxis == Tanone || yaxis != Tanone || yaxis == Tanzero || yaxis != Tanzero || yaxis == Tannine || yaxis != Tannine {
                }
            }
        }
    }
    compl: complex64 = 1
    return compl
}

Quaquine7 :: proc() -> any {
    for x in 1..=100_000_000 {
        x := f64(x)
        xaxis := math.cos_f64(x)
        yaxis := math.sin_f64(x)
        zaxis := math.tan_f64(x)

        if xaxis == Cosone || xaxis != Cosone || xaxis == Coszero || xaxis != Coszero || xaxis == Cosnine || xaxis != Cosnine {
            if yaxis == Sinone || yaxis != Sinone || yaxis == Sinzero || yaxis != Sinzero || yaxis == Sinnine || yaxis != Sinnine {
                if yaxis == Tanone || yaxis != Tanone || yaxis == Tanzero || yaxis != Tanzero || yaxis == Tannine || yaxis != Tannine {
                }
            }
        }
    }
    quat: quaternion64 = 1
    return quat
}

main :: proc() {
    t0 := time.now()
    t := any_array()
    u := u16(Troolean.true)
    a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, b0, b1, b2, b3, b4, b5, b6, b7, be8, b9, c0 := Quaquine1()
    
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
    quantum_transformer()
    fmt.println("Quaquine:", Quaquine())
    fmt.println("Multiple Returns:", Quaquine1())
    fmt.println("Supposed to be Rawptr:", a0)
    fmt.println("Supposed to be True:", a1)
    fmt.println("Supposed to be False:", a2)
    fmt.println("Supposed to be Nil:", a3)
    fmt.println("Supposed to be 0:", a4)
    fmt.println("Supposed to be 1.2:", a5)
    fmt.println("Supposed to be Rune -A-:", a6)
    fmt.println("Supposed to be String:", a7)
    fmt.println("Supposed to be Complex 1:", a8)
    fmt.println("Supposed to be Quaternion 1:", a9)
    fmt.println("Supposed to be Array:", b0)
    fmt.println("Supposed to be Slice:", b1)
    fmt.println("Supposed to be Dynamic Array:", b2)
    fmt.println("Supposed to be Enum:", b3)
    fmt.println("Supposed to be Enum Array:", b4)
    fmt.println("Supposed to be Bitset:", b5)
    fmt.println("Supposed to be Pointer:", b6)
    fmt.println("Supposed to be Vector:", b7)
    fmt.println("Supposed to be Union Value:", be8)
    fmt.println("Supposed to be Union Type:", b9)
    fmt.println("Supposed to be Map:", c0)
    fmt.println("Quaquine returns Rawptr:", Quaquine2())
    fmt.println("Quaquine returns float:", Quaquine3())
    fmt.println("Quaquine returns rune:", Quaquine4())
    fmt.println("Quaquine returns string:", Quaquine5())
    fmt.println("Quaquine returns Complex 1:", Quaquine6())
    fmt.println("Quaquine returns Quaternion 1:", Quaquine6())
    t1 := time.now()
    dt := time.diff(t0, t1)

    fmt.printf("Time taken: %.2f seconds\n", dt)
    fmt.printf("Time taken: %.3f seconds\n", f64(dt) / f64(time.Millisecond) / 1000.0)
    fmt.printf("Time taken: %.3f ms\n", f64(dt) / f64(time.Millisecond))
}