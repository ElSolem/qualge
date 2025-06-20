#+feature dynamic-literals
package main

import "core:math"
import "core:math/rand"
import "core:time"
import "core:fmt"
import "core:mem"

Anyproc :: proc() -> any {
    return Anyproc
}

Anyreturns :: proc() -> (any, any, any, any, any, any, any, any, any, any, any, any, any, any, any, any, any, any, any, any, any) {
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

    return cast(rawptr)cast(uintptr)0x6f6f, true, false, nil, 0, 1.2, 'A', "This is bananas", compl, quat, xarray, xslice, xdyn, Direction.East, Direction_Vectors, Direction.East, ptr, vec, val, s1, mapy
}

Anyptr :: proc() -> any {
    return cast(rawptr)cast(uintptr)0x7f7f
}

Anyfloat :: proc() -> any {
    return 1.2
}

Anyfibofloat :: proc() -> any {
    return 190392490709135.0
}

Anychar :: proc() -> any {
    return 'A'
}

Anystring :: proc() -> any {
    return "ABCDE"
}

Anycomplex :: proc() -> any {
    compl: complex64 = 1
    return compl
}

Anyquaternion :: proc() -> any {
    quat: quaternion64 = 1
    return quat
}

main :: proc() {
    // start time
    t0 := time.now()

    // Assignng multiple returns for testing
    a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, b0, b1, b2, b3, b4, b5, b6, b7, be8, b9, c0 := Anyreturns()
    
    //printing out all returns for testing
    //some returns have anomalous printouts

    // "Anyproc" returns itself
    fmt.println("Anyproc:", Anyproc())
    fmt.printfln("Anyproc: %v", Anyproc())

    // "Anyreturns" is multiple returns of various types
    //fmt.println("Multiple Returns:", Anyreturns()) //segfaults
    //fmt.printfln("Multiple Returns: %v", Anyreturns()) //segfaults

    //printing out returns
    fmt.println("Supposed to be Ptr:", a0)
    fmt.printfln("Supposed to be Ptr: %v", a0)
    fmt.println("Supposed to be True:", a1)
    fmt.printfln("Supposed to be True: %v", a1)
    fmt.println("Supposed to be False:", a2)
    fmt.printfln("Supposed to be False: %v", a2)
    fmt.println("Supposed to be Nil:", a3)
    fmt.printfln("Supposed to be Nil: %v", a3)
    fmt.println("Supposed to be 0:", a4)
    fmt.printfln("Supposed to be 0: %v", a4)
    fmt.println("Supposed to be 1.2:", a5)
    fmt.printfln("Supposed to be 1.2:%v", a5)
    fmt.println("Supposed to be Rune -A-:", a6)
    fmt.printfln("Supposed to be Rune -A-: %v", a6)
    fmt.println("Supposed to be String:", a7)
    fmt.printfln("Supposed to be String:%v", a7)
    fmt.println("Supposed to be Complex 1:", a8)
    fmt.printfln("Supposed to be Complex 1: %v", a8)
    fmt.println("Supposed to be Quaternion 1:", a9)
    fmt.printfln("Supposed to be Quaternion 1:%v", a9)
    fmt.println("Supposed to be Array:", b0)
    fmt.printfln("Supposed to be Array: %v", b0)

    // Everything after this segfaults
    //fmt.println("Supposed to be Slice:", b1) //segfaults
    fmt.printfln("Supposed to be Slice: %v", b1) // This segfaults only after creating massive area of massive integers
    fmt.println("Supposed to be Dynamic Array:", b2)
    //fmt.printfln("Supposed to be Dynamic Array: %v", b2)//segfaults
    fmt.println("Supposed to be Enum:", b3)
    fmt.printfln("Supposed to be Enum: %v", b3)
    fmt.println("Supposed to be Enum Array:", b4)
    fmt.printfln("Supposed to be Enum Array: %v", b4)
    fmt.println("Supposed to be Bitset:", b5)
    fmt.printfln("Supposed to be Bitset: %v", b5)
    fmt.println("Supposed to be Pointer:", b6)
    fmt.printfln("Supposed to be Pointer: %v", b6)
    fmt.println("Supposed to be Vector:", b7)
    fmt.printfln("Supposed to be Vector: %v", b7)
    fmt.println("Supposed to be Union Value:", be8)
    fmt.printfln("Supposed to be Union Value: %v", be8)
    fmt.println("Supposed to be Union Type:", b9)
    fmt.printfln("Supposed to be Union Type: %v", b9)
    fmt.println("Supposed to be Map:", c0)
    fmt.printfln("Supposed to be Map: %v", c0)
    fmt.println("Anyptr returns Rawptr:", Anyptr())
    fmt.printfln("Anyptr returns Rawptr: %v", Anyptr())
    fmt.println("Anyfloat returns float:", Anyfloat())
    fmt.printfln("Anyfloat returns float: %v", Anyfloat())
    fmt.println("Anyfibofloat returns float:", Anyfibofloat())
    fmt.printfln("Anyfibofloat returns float: %v", Anyfibofloat())
    fmt.println("Anychar returns rune:", Anychar())
    fmt.printfln("Anychar returns rune: %v", Anychar())
    //fmt.println("Anystring returns string:", Anystring()) //causes segfault
    //fmt.println("Anystring returns string: %v", Anystring())
    //fmt.println("Anycomplex returns Complex 1:", Anycomplex()) //causes segfault
    //fmt.println("Anycomplex returns Complex 1: %v", Anycomplex())
    //fmt.println("Anyquaternion returns Quaternion 1:", Anyquaternion()) //causes segfault
    //fmt.println("Anyquaternion returns Quaternion 1: %v", Anyquaternion())

    //just a time thing
    t1 := time.now()
    dt := time.diff(t0, t1)

    fmt.printf("Time taken: %.2f seconds\n", dt)
    fmt.printf("Time taken: %.3f seconds\n", f64(dt) / f64(time.Millisecond) / 1000.0)
    fmt.printf("Time taken: %.3f ms\n", f64(dt) / f64(time.Millisecond))
}