
proc add(a: int, b: int) -> int = a
proc foo(val: int) = add

proc main() -> int = {
    foo(0)(0, 2)
    0
}