import json

class Directory(dict):
    def __init__(self, file):
        self.atributos = ['nombre','correo','ciudad','direccion','telefono']
        self.file = file
        with open(file) as directory:
            contacts = json.load(directory)
            self.registros = contacts
    def __repr__(self):
        cad = ""
        for atr in self.atributos:
            print(atr, end=" ")
        print()
        for x in self.registros:
            for y in x:
                cad += (x[y])
                cad += " "
            cad += "\n"
        return cad
    def add(self, registro):
        self.registros.append(registro)
        with open('directory.json', 'w') as f:
            json.dump(self.registros, f)
    def delete(self, name):
        i = 0
        for x in self.registros:
            if(x['nombre'] == name):
                print(self.registros[i])
                del self.registros[i]
                break
            i += 1
        with open(self.file, 'w') as f:
            json.dump(self.registros, f)


if __name__ == '__main__':
    file = 'directory.json'
    d = Directory(file)
    while(True):
        print(d)
        print("Opciones")
        print("1. Ingresar nuevo contacto")
        print("2. Eliminar un contacto")
        print("3. Cerrar")
        
        opcion = int(input())
        if(opcion==1):
            registro = {}
            for atr in d.atributos:
                print(atr, end=" ")
                registro[atr] = input()
            d.add(registro)
        elif(opcion==2):
            name = input("nombre de contacto a borrar: ")
            d.delete(name)
        if(opcion==3):
            break
