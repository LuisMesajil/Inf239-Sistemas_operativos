import threading as th


#Hilos
def productor(num):
	global nelementos
	for n in range(nelementos):
		global indice
		global buffer
		global nbuffer
		item = n*n
		mutex.acquire()
		if indice<nbuffer:
			indice += 1
			if indice == nbuffer: indice = 0
			buffer[indice] = item
			print (f"productor {indice} {item} {buffer}", flush = True)
		mutex.release()
def consumidor(num):
	item = None
	global nelementos
	for _ in range(nelementos):
		global indice
		global buffer
		mutex.acquire()
		if indice<nbuffer:
			item = buffer[indice]
			buffer[indice] = None
			print (f"consumidor {indice} {item} {buffer}", flush = True)
			indice += 1
			if indice == nbuffer: indice = 0
		mutex.release()
#Variables del programa
nproductores = 15
nconsumidores = 15
nbuffer = 5
buffer = [None]*nbuffer
indice = -1
nelementos = 1
mutex = th.Condition()


#Crear lista de hilos
hilos = [th.Thread(target = productor, args = (n,)) for n in range(nproductores)]+[th.Thread(target = consumidor, args = (n,)) for n in range(nconsumidores)]

#Empezar Hilos
for hilo in hilos:
    hilo.start()






