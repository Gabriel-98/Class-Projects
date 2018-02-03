def calcularEuler():
    const = 10**2000
    e = 0
    f = 1
    for i in range(0,2000):
        if(i != 0):
            f = f * i
        k = const // f
        e += k
    return e
def eratostenes(Q):
    sieve= [False, False] + [True for i in range(2,Q)]
    for i in range(2,Q):
        if sieve[i]==True:
            j = 2*i
            while j<Q:
                sieve[j] = False
                j = j+i
    return sieve
if __name__ == "__main__":
    first = 0
    mayor = 0
    sieve = eratostenes(1000000)
    e = calcularEuler()
    cad = str(e)
    euler = [int(cad[i]) for i in range(1000)]
    numeros = []
    for i in range(0,995):
        x=0
        for j in range(0,6):
            x = x + (euler[i+j]*(10**(5-j)))
        if x>100000 and sieve[x]==True:
            if first==0:
                first = x
            if x > mayor:
                mayor = x
    print("primero = ", first)
    print("mayor = ", mayor)
