package main

import "core:fmt"
import "core:time"
import "vendor:sdl2"
import sdl2image "vendor:sdl2/image"
import "core:math"
import rand "core:math/rand"
import noise "core:math/noise"
import "core:mem"


Allocator :: mem.Allocator

TealAllocator :: struct {
    backing: ^Allocator,
}

allocate :: proc(a: Allocator, size, align: int) -> rawptr {
    ptr, ptr_alloc := mem.alloc(size, align)
    addr := cast(uintptr)ptr

    fmt.printfln("Teal test: %X", time.now())
    fmt.printfln("Requested size: %d | align: %d", size, align)
    fmt.printfln("RAW addr: %p", ptr)

    if ((addr & 0xFF0000) != 0x00FF00) {
        fmt.printfln("FALLBACK -> forcing to teal: 0x6F6F instead of 0x%X", addr)
        ptr = rawptr(uintptr(0x6f6f))
    }

    fmt.printfln("Mem Ptr: %p\n", ptr)
    return ptr
}


infiniswitch :: proc() {
        for x in 0..<1_000_000_000 * int(time.now()._nsec) {
        for y in 0..<1_000_000_000 * int(time.now()._nsec) {
            nx := x + 1
            ny := y + 1
            if ((nx * nx) == (nx /ny)) || ((nx*ny)==(nx/ny)) ||
             ((ny*ny)==(nx/ny)) || ((nx*nx) != (nx /ny)) ||
              ((nx*ny)!=(nx/ny)) || ((ny*ny)!=(nx/ny)) {
                switch {
                    case ((nx * nx) == (nx /ny)):
                        fmt.printfln("Mem Ptr:", allocate(context.allocator, 100, 8))
                        fallthrough
                    case ((nx * ny) == (nx /ny)):
                        fmt.printfln("Mem Ptr:", allocate(context.allocator, 1000, 8))
                        fallthrough
                    case ((ny * ny) == (nx /ny)):
                        fmt.printfln("Mem Ptr:", allocate(context.allocator, 10000, 8))
                        fallthrough
                    case ((nx * nx) != (nx /ny)):
                        fmt.printfln("Mem Ptr:", allocate(context.allocator, 100000, 8))
                        fallthrough
                    case ((nx * ny) != (nx /ny)):
                        fmt.printfln("Mem Ptr:", allocate(context.allocator, 1000000, 8))
                        fallthrough
                    case ((ny * ny) != (nx /ny)):
                        fmt.printfln("Mem Ptr:", allocate(context.allocator, 10000000, 8))
                        fallthrough
                    case:
                        fmt.printfln("Mem Ptr:", allocate(context.allocator, 100000000, 8))
                        fmt.printfln("Mem Ptr:", allocate(context.allocator, 1000000000, 8))
                        fmt.printfln("Mem Ptr:", allocate(context.allocator, 10000000000, 8))
                        fmt.printfln("Mem Ptr:", allocate(context.allocator, 100000000000, 8))
                        return
                }
            }
        }
    }
}

infiniswitch2 :: proc() {
        for x in 0..<1_000_000_000 * int(time.now()._nsec) {
        for y in 0..<1_000_000_000 * int(time.now()._nsec) {
            nx := x + 1
            ny := y + 1
            if ((nx * nx) == (nx /ny)) || ((nx*ny)==(nx/ny)) || ((ny*ny)==(nx/ny)) || ((nx*nx) != (nx /ny)) || ((nx*ny)!=(nx/ny)) || ((ny*ny)!=(nx/ny)) {
                switch {
                    case x == 100:
                        fmt.printfln("Mem Ptr:", allocate(context.allocator, 100, 8))
                    case x == 1000:
                        fmt.printfln("Mem Ptr:", allocate(context.allocator, 1000, 8))
                    case x == 1e4:
                        fmt.printfln("Mem Ptr:", allocate(context.allocator, 10000, 8))
                    case x == 1e5:
                        fmt.printfln("Mem Ptr:", allocate(context.allocator, 100000, 8))
                    case x == 1e6:
                        fmt.printfln("Mem Ptr:", allocate(context.allocator, 1000000, 8))
                    case x == 1e7:
                        fmt.printfln("Mem Ptr:", allocate(context.allocator, 10000000, 8))
                    case:
                        fmt.printfln("Mem Ptr:", allocate(context.allocator, 100000000, 8))
                        fmt.printfln("Mem Ptr:", allocate(context.allocator, 1000000000, 8))
                        fmt.printfln("Mem Ptr:", allocate(context.allocator, 10000000000, 8))
                        fmt.printfln("Mem Ptr:", allocate(context.allocator, 100000000000, 8))
                }
            }
        }
    }
}

main :: proc() {
    t0 := time.now()
    fmt.printfln("Teal test: %X", int(time.now()._nsec))

    infiniswitch()
    infiniswitch2()

    t1 := time.now()
    dt := time.diff(t0, t1)

    fmt.printf("Time taken: %.2f seconds\n", dt)
    fmt.printf("Time taken: %.3f seconds\n", f64(dt) / f64(time.Millisecond) / 1000.0)
    fmt.printf("Time taken: %.3f ms\n", f64(dt) / f64(time.Millisecond))
}