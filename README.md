# SecureHash
DOSP Project 1.

Group members - 

Mayur Reddy Junnuthula (UFID - 36921238), Akhil Srivatsa (UFID - 80826297)

Project Description

Steps to run the project - 

1)  Build the project and run it using the erlang console configuration.
2) Start the server with the command server:start() in the console.
3) Server/s Implementation
4) Enter the number of leading zeros which should be present in the hash string for mining.
5) This will start the master/server and will start mining the coins.
6) Client/s or worker/s Implementation (Distributed)
7) Enter the server’s IP address where the master program is running.

Working - 

**Server/Master**

Once the user starts the application, the server spawns the parent process while waiting for a TCP connection by listening to a port specified in the program. The parent process then spawns several child processes and distributes the work between them as and when the child finishes its work and is available for the next task. When a child process finishes its work, it reports back to the parent process the output hash string and then the parent assigns new work to the child. With this local parallelism is achieved. The parent acts as a supervisor and is also responsible for restarting the child when it fails.

**Client/Worker**

Once the user starts the application by entering the IP address of the server, the client notifies the server that its available by sending a connection request to the server to which the server acknowledges the request by establishing the connection and responding back with the number of leading zeros. Then the client executes it’s own parent process which is the same program as the server and returns the output back to the server where it gets printed. The aggregate output is printed by the server/master. 



 
