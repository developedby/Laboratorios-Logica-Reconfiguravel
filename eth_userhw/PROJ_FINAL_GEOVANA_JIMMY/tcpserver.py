import socket
import time

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind(('', 7777))
s.listen(1)

conn, addr = s.accept()
print ('IP conectado:', addr)
i = 0
while True:
    conn.send(bytes([0x87]))
    time.sleep(0.1)
    conn.send(bytes([0xe0]))
    time.sleep(0.1)
    conn.send(bytes([0x81]))
    time.sleep(0.1)
    conn.send(bytes([0x60]))
    bits = int.from_bytes(conn.recv(2000), 'little')
    print('Valor', i, 'Recebido:', bits)
    print('Zeros:', bits % 256)
    print('Uns:' , (bits//256) % 256)
    time.sleep(1)
    i += 1
conn.close()
