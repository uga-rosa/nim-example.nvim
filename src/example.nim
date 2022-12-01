proc ackermann*(m, n: int): int {.exportc, dynlib.} =
  if m == 0: return n+1
  if n == 0: return ackermann(m-1, 1)
  return ackermann(m-1, ackermann(m, n-1))
