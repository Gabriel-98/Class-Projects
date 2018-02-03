class Node(object):
    def __init__(self, val, ant, sig):
        self.nodo1 = Node.NodeInfo(val, ant)
        self.nodo2 = Node.NodeLink(self.nodo1, sig)
        if(sig != None):
            sig.actual.ant = self.nodo2
        if ant != None:
            ant.sig = self.nodo2
    class NodeInfo(object):
        def __init__(self, val, ant):
            self.val = val
            self.ant = ant
    class NodeLink(object):
        def __init__(self, actual, sig):
            self.actual = actual
            self.sig = sig

class DLink(object):
    def __init__(self):
        self.first = Node(None, None, None)
    def add(self, x, pos=None):
        temp = self.first.nodo2
        if pos==None:
            while temp.sig != None:
                temp = temp.sig
        else:
            while pos > 1:
                pos -= 1
                temp = temp.sig
                if temp == None:
                    break
        if pos==None or pos==1:
            temp = Node(x, temp, temp.sig)
    def remove(self, x):
        temp = self.first.nodo2
        while temp != None:
            if temp.actual.val == x:
                break
            temp = temp.sig
        if temp != None:
            p = temp.actual.ant
            q = temp.sig
            if q == None:
                p.sig = q
            else:
                q.actual.ant = p
                p.sig = q
    def printList(self):
        temp = self.first.nodo2.sig
        print("Lista: ", end=" ")
        while temp != None:
            print(temp.actual.val, end=" ")
            temp2 = temp
            temp = temp.sig
        print()
        print("Lista invertida: ", end=" ")
        while temp2.actual.val != None:
            print(temp2.actual.val, end=" ")
            temp2 = temp2.actual.ant
        print()
           
    
L = DLink()
L.add(5)        # 5
L.add(6)        # 5 6
L.add(21)       # 5 6 21
L.add(13)       # 5 6 21 13
L.add(2)        # 5 6 21 13 2
L.add(7,3)      # 5 6 7 21 13 2
L.add(456,6)    # 5 6 7 21 13 456 2
L.add(651,8)    # 5 6 7 21 13 456 2 651
L.add(798,1)    # 798 5 6 7 21 13 456 2 651
L.remove(6)     # 798 5 7 21 13 456 2 651
L.remove(7)     # 798 5 21 13 456 2 651
L.remove(1000)  # 798 5 21 13 456 2 651
L.remove(798)   # 5 21 13 456 2 651
L.printList()
