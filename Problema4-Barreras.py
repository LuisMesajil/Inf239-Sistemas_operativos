import threading as th

#Definir hilo
def hilo (num):
	for i in range (10):
		print (f"Hilo {num} valor de {i+1}", flush=True)
		other = contador[1-num]
		b1.wait()
		contador[num] = other + 1
		b2.wait()
#Variables del programa
nhilos = 2 #Número de hilos
contador = [0]*nhilos
b1 = th.Barrier(nhilos)
b2 = th.Barrier(nhilos)
#Crear lista de hilos
hilos = [th.Thread(target = hilo, args = (n,)) for n in range(nhilos)]

#Empezar hilo/hilos
for hilo in hilos:
    hilo.start()
for hilo in hilos:
    hilo.join()
for i in range(nhilos):
    print (f"contador de hilo {i} {contador[i]}")