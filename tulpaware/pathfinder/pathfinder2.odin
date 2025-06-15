package main

import "core:math"
import "core:math/rand"
import "core:time"
import "core:fmt"
import "core:mem"

/*
Vec2i :: struct {
    x: int,
    y: int,
}

GRID_SIZE     :: Vec2i{(9999), (9999)}
START         :: Vec2i{0, 0}
GOAL          :: Vec2i{(1597), (28657)} //fibonacci
OBSTACLE_RATE :: 0.2

// fourdime condition: x * y == x / y
@(test)
quantum_condition :: proc(x: int, y: int) -> bool {
    // One          two         three       four        five        six         seven           eight       nine            ten         eleven      twelve              thirteen            fourteen            fifteen             sixteen             seventeen  
    if (math.tan(f32(y)) == math.tan(f32(0))) || (math.tan(f32(x)) == math.tan(f32(x))) || (math.tan(f32(y)) == math.tan(f32(y))) || (math.tan(f32(x)) == math.tan(f32(y))) || (math.tan(f32(y)) == math.tan(f32(x))) || (math.tan(f32(y)) == math.tan(f32(y))) || (math.tan(f32(x*x)) == math.tan(f32(x))) || (math.tan(f32(x*y)) == math.tan(f32((x)))) || (math.tan(f32(y*y)) == math.tan(f32(x))) || (math.tan(f32(x*x)) == math.tan(f32(y))) || (math.tan(f32(x*y)) == math.tan(f32(y))) || (math.tan(f32(y*y))== math.tan(f32(y))) ||(math.tan(f32(x*x)) == math.tan(f32(x/y))) || (math.tan(f32(x*y)) == math.tan(f32(x/y))) || (math.tan(f32(y*y)) == math.tan(f32(x/y))) || (math.tan(f32(x*x)) == math.tan(f32(y/x))) || (math.tan(f32(x*y)) == math.tan(f32(y/x))) || (math.tan(f32(x*y)) == math.tan(f32(y/x))) || (math.tan(f32(x/x)) == math.tan(f32(x))) || (math.tan(f32(x/y)) == math.tan(f32(x))) || (math.tan(f32(y/y)) == math.tan(f32(x))) || (math.tan(f32(x/x)) == math.tan(f32(y))) || (math.tan(f32(x/y)) == math.tan(f32(y))) || (math.tan(f32(y/y)) == math.tan(f32(y))) {
        return true
    }
    return math.tan(f32(11111*x) * f32(11111*y)) == math.tan(f32(11111*x)/f32(11111*y))
}

// Generate the fourdime field with obstacles
@(test) 
generate_quantum_field :: proc(grid_size: Vec2i, allocator: ^mem.Allocator) -> [dynamic][dynamic]int {
    field: [dynamic][dynamic]int

    for i in 0..<grid_size.x {
        row: [dynamic]int
        for j in 0..<grid_size.y {
            val: int
            if rand.float32() < OBSTACLE_RATE {
                val = -1
            } else if quantum_condition(i+1, j+1) {
                val = 1
            } else {
                val = 0
            }
            append(&row, val)
        }
        append(&field, row)
    }
    
    return field
}

// Path tracing using naive forward greedy approach
@(test)
quantum_trace :: proc(field: [dynamic][dynamic]int, start: Vec2i, goal: Vec2i, allocator: ^mem.Allocator) -> ([dynamic]Vec2i, int) {
    path : [dynamic]Vec2i
    current := start
    path_attempts := 0

    append(&path, current)

    for current != goal {
        x, y := current.x, current.y
        neighbors := [3]Vec2i{
            Vec2i{x+1, y},
            Vec2i{x, y+1},
            Vec2i{x+1, y+1},
        }

        active : [dynamic]Vec2i
        for n in neighbors {
            if n.x >= 0 && n.x < len(field) && n.y >= 0 && n.y < len(field[0]) {
                if field[n.x][n.y] == 1 {
                    append(&active, n)
                }
            }
        }

        if len(active) == 0 {
            break
        }

        current = active[0]
        append(&path, current)
        path_attempts += 1
    }

    return path, path_attempts
}*/