import math

Q = 1000
sieve = 2 * [False] + [True for i in range(2, Q+1)]
raiz = int(math.sqrt(Q))
for i in range(raiz+1):
    if sieve[i]:
        j = i*2
        while j <= Q:
            sieve[j] = False
            j += i
for i in range(Q+1):
    if sieve[i]:
        print(i, end="\t")
