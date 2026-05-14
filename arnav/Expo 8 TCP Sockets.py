-- server.py --

import socket

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind(('localhost', 10000))
server.listen(1)

print("Server is waiting for connection...")

connection, client_address = server.accept()
print("Connected to:", client_address)

file_name = "text_file.txt"
connection.sendall(file_name.encode())

file = open(file_name, 'rb')
data = file.read()
connection.sendall(data)

file.close()
connection.close()
server.close()

print("File sent successfully") 


-- client.py --

import socket

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

print("Connecting to server...")
client.connect(('localhost', 10000))
print("Connected!")

print("Receiving file name...")
file_name = client.recv(1000).decode()
print("File name received:" + file_name)

file_name = "hello_" + file_name
file = open(file_name, 'wb')

print("Receiving file data...")
data = client.recv(4096)

file.write(data)

file.close()
client.close() 

print("File received successfully") 
