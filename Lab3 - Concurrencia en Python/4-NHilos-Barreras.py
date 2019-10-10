import threading as th

#Definir hilo
def hilo (num):
	global nsumas
	for i in range (nsumas):
		print (f"Hilo {num} valor de {i+1}", flush=True)
		other = contador[1-num]
		b1.wait()
		contador[num] = other + 1
		b2.wait()
#Variables del programa
nhilos = 2 #Número de hilos
contador = [0]*nhilos
nsumas = 10
b1 = th.Barrier(nhilos)#Listos para sumar
b2 = th.Barrier(nhilos)#Sumas finalizadas
#Crear lista de hilos
hilos = [th.Thread(target = hilo, args = (n,)) for n in range(nhilos)]

#Empezar hilo/hilos
for hilo in hilos:
    hilo.start()
for hilo in hilos:
    hilo.join()
for i in range(nhilos):
    print (f"contador de hilo {i} {contador[i]}")