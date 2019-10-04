import threading as th

#Variables del programa
mensajes = ["Operativos", "INF", "Sistemas"]
nhilos = len(mensajes) #Número de hilos
l = th.Lock()#Candado


#Definir hilo
def hilo (num, mensaje):
	print (mensaje)
#Crear lista de hilos
hilos = [th.Thread(target = hilo, args = (n,mensajes[n])) for n in range(nhilos)]

#Empezar hilo/hilos
for hilo in hilos:
    hilo.start()