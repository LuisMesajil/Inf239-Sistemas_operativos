import threading as th

#Variables del programa
nhilos = 3 #Número de hilos
l = th.Lock()#Candado

#Definir hilo
def hilo (num):
    l.acquire ()
    for i in range (10):
        print (f"Hi, I am {num}, ")
    l.release()
#Crear lista de hilos
hilos = [th.Thread(target = hilo, args = (n,)) for n in range(nhilos)]

#Empezar hilo/hilos
for hilo in hilos:
    hilo.start()