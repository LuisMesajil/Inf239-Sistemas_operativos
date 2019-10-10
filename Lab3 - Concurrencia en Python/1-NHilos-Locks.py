import threading as th


#Hilos
def hilo (num):
	global nmensajes
	lock.acquire ()
	for i in range (nmensajes):
		print (f"Hi, I am {num}, ")
	lock.release()
#Variables del programa
nhilos = 3 #Número de hilos
lock = th.Lock()#Candado
nmensajes = 5

#Crear lista de hilos
hilos = [th.Thread(target = hilo, args = (n,)) for n in range(nhilos)]

#Empezar Hilos
for hilo in hilos:
    hilo.start()