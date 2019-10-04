import threading as th


#Hilos
def line1 (num):
	e2.wait()
	print ("Operativos")
def line2 (num):
	print ("INF ", end="")
	e1.set()
def line3 (num):
	e1.wait()
	print ("Sistemas ", end = "")
	e2.set()
#Variables del programa
fhilos = [line1, line2, line3]
nhilos = len(fhilos) #Número de hilos
l = th.Lock()#Candado
e1 = th.Event()#Ocurrió INF
e2 = th.Event()#Ocurrió Sistemas
e1.clear()
e2.clear()
#Crear lista de hilos
hilos = [th.Thread(target = fhilos[n], args = (n,)) for n in range(nhilos)]

#Empezar hilo/hilos
for hilo in hilos:
    hilo.start()