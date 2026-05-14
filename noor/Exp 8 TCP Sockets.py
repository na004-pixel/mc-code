#------server code----------

import socket

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind(("localhost", 10000))
server.listen(1)

print("Waiting for client...")

conn, addr = server.accept()

with open("text_file.txt", "rb") as file:
    data = file.read()

conn.sendall(data)

print("File sent")

conn.close()
server.close()


#-----------client code----------------
import socket

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect(("localhost", 10000))

data = client.recv(4096)

with open("received.txt", "wb") as file:
    file.write(data)

print("File received")

client.close()
