const cache = [1, 1]
function fibonacci(num) {
  if (cache.length > num) {
    return cache[num]
  }
  return fibonacci(num - 1) + fibonacci(num - 2)
}
