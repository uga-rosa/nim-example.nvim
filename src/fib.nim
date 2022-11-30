var mem: seq[int] = @[0, 1]

proc fib*(n: int): int {.exportc, dynlib.} =
  if mem.len > n: return mem[n]
  let m = fib(n-1) + fib(n-2)
  mem.add(m)
  return m
