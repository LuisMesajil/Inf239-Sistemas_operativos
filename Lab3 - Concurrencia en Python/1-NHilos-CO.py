import threading as th


#Hilos
def hilo (num):
	global nmensajes
	co.acquire ()
	for i in range (nmensajes):
		print (f"Hi, I am {num}, ")
	co.release()
#Variables del programa
nhilos = 5 #Número de hilos
co = th.Condition()#Conditional object
nmensajes = 10

#Crear lista de hilos
hilos = [th.Thread(target = hilo, args = (n,)) for n in range(nhilos)]

#Empezar Hilos
for hilo in hilos:
    hilo.start()