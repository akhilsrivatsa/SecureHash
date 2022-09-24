# SecureHash
DOSP Project 1.

Group members - 

Mayur Reddy Junnuthula (UFID - 36921238), Akhil Srivatsa (UFID - 80826297)

Project Description

**Steps to run the project** - 

1)  Build the project and run it using the erlang console run configuration in IntelliJ IDEA with just default (zero) arguments and default settings.
2) Start the server with the command server:start() in the erlang console, the input format is different for server and client machines / instances as stated below.
3) Enter the number of leading zeros which should be present in the hash string for mining. (for Server machine)
4) This will start the master/server and will start mining the coins in the server.
5) Enter the server’s IP address where the master program is running. (for Client(s) machine)
6) This will start the slave/client and will start mining the coins and sends the output to the server whenever a valid coin is found.

**Input Format** - 

The input format is a number or an IP Address enclosed within double quotes.
For example, Input for server - "4", Input for client - "127.0.0.1".

**Working** - 

**Server**

Once the user starts the application, the server spawns the parent process while waiting for a TCP 
connection by listening to a port specified in the program. The parent process then spawns several
child processes and distributes the work between them as and when the child finishes its work and 
is available for the next task. When a child process finishes its work, it reports back to the
parent process the output hash string and then the parent assigns new work to the child. With
this local parallelism is achieved. The parent acts as a supervisor and is also responsible
for restarting the child when it fails. Currently the no of processes spawned in each child
actor is Number of Cores * 8. 

**Client**

Once the user starts the application by entering the IP address of the server, the client 
notifies the server that its available by sending a connection request to the server to which t
he server acknowledges the request by establishing the connection and responding back with the 
number of leading zeros. Then the client executes it’s own parent process which is the same program
as the server and returns the output back to the server where it gets printed. The aggregate output is
printed by the server/master.

**Note** - There can be multiple clients which can be connected to a server, and multiple 
instances of the application running inside the client which can be connected to different 
servers. Also, in our system the server and worker program are installed/present in all the systems involved in the distributed system architecture.  

Project ReadMe Questions/Tasks: 
1. Size of the work unit that you determined results in the best performance for your implementation and an explanation of how you determined it. The size of the work unit refers to the number of sub-problems that a worker gets in a single request from the boss. 

   **Ans**. In our system, each worker has the following tasks/sub-problems

    -> Connecting to the server (low load)

    -> Receiving the input, i.e, no of Leading zeros (low load)
    
    -> Executing the parallelized mining process (high load)

    -> Validating and returing the output to the server (low load)

    After testing various design and work distributions between the server and the worker program and an exhaustive trial and error process, we believe for our application which uses TCP connection this is the most optimal structure of the worker program. So according the size of work here is 4.


2. The result of running your program for input 4

**Ans**.

Eshell V13.0.4  (abort with ^G)

1> server:start().
Enter the input (Number of leading zeros if you are the server or The IP Address of the server if you are the client)

"4".

{4,<0.79.0>}

2> accepting state....2> Server mined Coin : mayurzUcw87jjIYXA55R3XwGKpLK7J+TmT7qMvOBeB9fLnQs;    00006df5cab699646164b11c7e092a0efabe92cbe8a5e4021e12db29b1d2cb76 mined by actor: <0.107.0> with performance metrics (since last call) : 12.6 and (total) : 1.0351682919156968

2> Server mined Coin : mayurGwC+2E2YzOWbgkw+hKsYV4S/uo24mnub3wE+XYhQyIo;    000018a702763fec53021a8e93b4036f508116908383ba84936f5e60e8ad34de mined by actor: <0.163.0> with performance metrics (since last call) : 11.208955223880597 and (total) : 1.0778773259820813

2> Server mined Coin : mayurQQx6PRS3UQ9Rr3YEYQSIGbc7E1luWTUIkiwAZvXMvK4;    00006445c42a139e361c08a2a0e39273d9a50e79be579ce0d074664391c0ce2d mined by actor: <0.100.0> with performance metrics (since last call) : 13.731707317073171 and (total) : 1.1103056058996312

2> Server mined Coin : mayurkkuBcArzqVCMT4mzKBKQZdE5bCmvAG4BpLO+fAsJEfE;    0000732abb6b872b0857053a30f553e87f9a16f7673324756e3f6ac306ea9257 mined by actor: <0.92.0> with performance metrics (since last call) : 6.75 and (total) : 1.1201647117544298

2> Server mined Coin : mayurAfiifdoDN0mi4tCGhb67KxviM2uWNOoVRUmhv6a6BOc;    0000a8563b1e195ea4fc6cfcb9a44e702fb8143fa64596cd59c6bd1c2e3da445 mined by actor: <0.102.0> with performance metrics (since last call) : 12.413793103448276 and (total) : 1.1405705032386646

2> Server mined Coin : mayurUaEHUVpsauU+3In9E5iPeQ2GFVR7c5rV8e27kCvxwrY;    0000add664db570109d195e54d7bcbbe15c37dd7b6754e56ceeef8f0ba37dced mined by actor: <0.157.0> with performance metrics (since last call) : 11.058823529411764 and (total) : 1.1615389396482068

2> Server mined Coin : mayurirnupLcDLyv5WpeWLZi0WKKhXO7YExHKJu00hDGvI7g;    000011da9c1f028e1097cc2c9f1f3b2c9421af7368c05feeb0520724aa857387 mined by actor: <0.103.0> with performance metrics (since last call) : 11.510204081632653 and (total) : 1.1929726715002789

2> Server mined Coin : mayur96uXPFHMJfuRNoFfKbkYvM0NLGlP92bgqRSmcRmeqiQ;    0000a8a07cf3537322985bc1523b5f14e791a6462a6ef8c6608c0ba841f66663 mined by actor: <0.101.0> with performance metrics (since last call) : 0.5 and (total) : 1.1928987482959474

2> Server mined Coin : mayurGV9Jozv2IbaZZm6/2Tr3+UfF65Z91VFxUy6gf2FIpq4;    0000a911b4f6010bba12ed5ea132789c4f672a9624fa77089be4e8f847f38335 mined by actor: <0.125.0> with performance metrics (since last call) : 37.6 and (total) : 1.2041878329822822
            
            |

            |   so on...     

            |

2> Server mined Coin : mayurung+eLBzJAPgAkGzwKxShuaki7LZPK6x/OPdgx1HfBE;    0000a8685929477fe15fbf5462aff7b2abde761747fee33b9f9c8d8d716c6d88 mined by actor: <0.98.0> with performance metrics (since last call) : 0.07692307692307693 and (total) : 5.3203029290566874

2> Server mined Coin : mayur8ph+0c2ykNz6ycI3kBRAoqpw12+epnEkAfxBknSJL7U;    0000f51ba613acb508d593ca2390bab09f7bb9d133e8d0db7935dcf4c1ff9851 mined by actor: <0.93.0> with performance metrics (since last call) : 12.857142857142858 and (total) : 5.328289571280226

2> Server mined Coin : mayurNqXU4GcHOqlCgQNwr4dz9WrvyRpR5mRn0N88s0t777Y;    00002fd4a5669760a1da410f3596ffcf9c9cabfa9e0408cab31ea9c77ffac84d mined by actor: <0.114.0> with performance metrics (since last call) : 15.695652173913043 and (total) : 5.337286000148225

2> Server mined Coin : mayurNR/8O8xwLDOXXfYcFa+4PU2DK3TAJCZzbeUrFYvs3gA;    00009abded3bf5ff69e0f1cb2008a3f601796ff8af2a183b7d13ddaf6dbf34b7 mined by actor: <0.134.0> with performance metrics (since last call) : 9.838709677419354 and (total) : 5.358036076579734

2> Server mined Coin : mayurHsB4n5U76FNdHNcGqsMfFZgvycLnVmJKe3BKCdh9Z3E;    00002526684198ecd0968b12fc74fab507bfb5bb24307a3616d2291f504d2194 mined by actor: <0.97.0> with performance metrics (since last call) : 13.3 and (total) : 5.369898335052306

2> Server mined Coin : mayurRO8UokHjnOaVkHAAWLUJ+3OYYUExDGPgVNI8g0mkigw;    0000bd5a3fdb02105da60a0379b2c4b1227b6c7b59462edf40dce1771ea1e579 mined by actor: <0.172.0> with performance metrics (since last call) : 0.125 and (total) : 5.368514085803719

2> Server mined Coin : mayurmFzCynb6e97sifvU1JjxY764DdFx3JOJyrL9Tr/Tm18;    0000506e2550981b5804f4d2bcf9fc4feeb2b71a15a23c30dd333eea45d38bdc mined by actor: <0.154.0> with performance metrics (since last call) : 12.25 and (total) : 5.383846549570074

2> Server mined Coin : mayurLjSVK7KnvLQD/B4ueVwJ7/dArwup6ce7NQQDv8qM02I;    0000f706d3527e09ba6bd3de46647f1032bae7b064e89a063b21e9728cf273aa mined by actor: <0.85.0> with performance metrics (since last call) : 10.5 and (total) : 5.3873893724064486

2> Server mined Coin : mayursngbodcoFbVH8351cTPIoChCvUDIXNBCBzj2J3GfCoQ;    0000fd1f303f3743c378e3a9306d1e874b01105ed6be06a41e384605b4f25f5b mined by actor: <0.119.0> with performance metrics (since last call) : 0.3333333333333333 and (total) : 5.3869937208533765

2> Server mined Coin : mayuroCWXooaQAkMrzeoX4S/+Mmdet5O5oTcjFDCGsZLLawI;    00003fb15aad2f11756283a45451e2c4639387a57b9bc2fb9602438c95bb9fd9 mined by actor: <0.85.0> with performance metrics (since last call) : 13.093023255813954 and (total) : 5.399303391384051

2> Server mined Coin : mayurfjFxYTDp6/kaRr2fBs87qtNZxOz1uNl+hsZwB0oCrKk;    0000a4479d5ccd168323d6602ca1a92dfda425dfa61ee5780a4ae9c31fab6416 mined by actor: <0.102.0> with performance metrics (since last call) : 21.0 and (total) : 5.404610929883077

2> Server mined Coin : mayurBQSuEYWMAc4Cqw6TNlSxppzJxb7XX8vp6Z3Jn4icx6Y;    0000bb2f0330114741d59447980732fe0afd2df73d38fb8bd3f1ffb4d91396b5 mined by actor: <0.168.0> with performance metrics (since last call) : 7.52 and (total) : 5.406708902479218

2> Server mined Coin : mayur7jmEODQIlvgxdcTfUjFJ9RUN69q4vIDuA4YrO+tjn8Y;    00008c848bb37d05b12fa025f7730d60f91a4af262ac3b1d052963a02003723b mined by actor: <0.134.0> with performance metrics (since last call) : 11.822222222222223 and (total) : 5.427945685501533

2> Server mined Coin : mayurjhi7w6t1FxIi8bDUgIwCh2NMJcKwWZMZpTJRx94rJw0;    000074b6794c4ee608196f1e083df2e897bef184943554dea34dcfe663a60690 mined by actor: <0.120.0> with performance metrics (since last call) : 10.734939759036145 and (total) : 5.444137127884125

2> Server mined Coin : mayur0/kjWGX9XFVB3Fwaz/RGskJjz/mbzcfoxAedEGp1gok;    0000aecb5991f3f2135c1eb15fdafdba3d469521d494e7762e22dba23f49d854 mined by actor: <0.135.0> with performance metrics (since last call) : 11.988888888888889 and (total) : 5.465665469583198

2> Server mined Coin : mayurWV2hH0eA3vQEwKnzuZrnJslD9SnxLeM3rm9B0r9wkZc;    0000bcd0be16a526460e7d7b1a7fdf902def543f30702b55be867f9dec88f847 mined by actor: <0.156.0> with performance metrics (since last call) : 0.5 and (total) : 5.4654672083575155

2> Server mined Coin : mayurhHz9ODmaRqE2r36Va4nj5Z4nb7eeHN4802Nh3UuR7xY;    000033db01984f1aee5ece39ff22024eb7be26a00d7f701a9e8c69d3d4c2f2ff mined by actor: <0.99.0> with performance metrics (since last call) : 9.025 and (total) : 5.4707863947549535

2> Server mined Coin : mayurlLyyxoachuYcDuqzrbhx+5uJQOgzTArLUCqDTv74HVo;    0000b45dda1e0285c5940f372aaadcf3203e3abe83302d9ddc0a1b32997904a1 mined by actor: <0.90.0> with performance metrics (since last call) : 15.727272727272727 and (total) : 5.475033493862476

            |

            |   so on...     

            |

2> Server mined Coin : mayurkrT4xwIHcczfj1H+HWaBhnlWJofvPNa8NgPc7eWg05I;    000079fb1f251561ae3093984235849e826e70569cb4468c9fa615674201de9b mined by actor: <0.116.0> with performance metrics (since last call) : 11.058823529411764 and (total) : 6.087221425778704

2> Server mined Coin : mayurpN1lIgnKn2W46QDKt/+k4Cb/+6qPfoIf7rIlHwiCMB8;    000073625eafa841b23bcadc45247d46ae0090a710b908829c4114aab46b831a mined by actor: <0.141.0> with performance metrics (since last call) : 8.238095238095237 and (total) : 6.08885777546236

2> Server mined Coin : mayur2DDsKJUWDIPJwG/34V8+fLf34JGl41Ky7KZCZS3howc;    00000f7b42fa8c1f9ebfd699576126f2ca523f82f259d080e4d630b9011524bf mined by actor: <0.172.0> with performance metrics (since last call) : 12.533333333333333 and (total) : 6.0921694981448935

2> Server mined Coin : mayurWXxvWYiOjlIhbRehTo2v4JOoLoJaI8hOXwancxEojyk;    0000492ac5a861537b5d366b5b81d86bd5376483bf9ab38e21931c5536c8e17a mined by actor: <0.171.0> with performance metrics (since last call) : 8.025641025641026 and (total) : 9.56321876562534

2> Server mined Coin : mayurLi2UNnl8vIDIJsysUHhC3f3Q3QtT3XPLsTE1HYSZiAM;    00004fbb3ebc5f4270a733dd2ba78740ba8c86da03f51ae5255dca6af99a3351 mined by actor: <0.90.0> with performance metrics (since last call) : 9.145833333333334 and (total) : 9.563094138736487

2> Server mined Coin : mayurEUY6KUT+wUxbzmC7Cwx/e3pT4SA6VXjd4qp1scW52xY;    000081f45760f48e9e33cceaebc5fae7bb73871c04495422304e35df812e3fa9 mined by actor: <0.136.0> with performance metrics (since last call) : 9.105263157894736 and (total) : 9.563092664805621

2> Server mined Coin : mayurD8jAcBjD8qUhXjWOO3w7VSl5ZgPDirU1vRrmtpvMt5I;    00001c0ca8a8b09f05802ab2aed41338900932e5f3a781a015251f636869c094 mined by actor: <0.123.0> with performance metrics (since last call) : 17.09090909090909 and (total) : 9.564085019495401

2> Server mined Coin : mayurXsnmvwrOTVOrhogDiwPDCwl7BcKtJOOOWxKj1W9SRXY;    00001c959ef04bdc237da7c7f2dbd08d07362d348269adfa525958dc62dd67c6 mined by actor: <0.161.0> with performance metrics (since last call) : 13.142857142857142 and (total) : 9.566353334491144

2> Server mined Coin : mayurMNeIt9mPeaYSUW+x7jbITta1gO5QjzJqtSmRBIn2BKE;    000064a8fefe8a78667f6c0012999f6d8d9ac53848a6bcb75c59fd3faef9f19a mined by actor: <0.179.0> with performance metrics (since last call) : 0.1111111111111111 and (total) : 9.565522705565686

2> Server mined Coin : mayur3DNn2z1a+pvbbaOMEGCQNaWQ6DIZu8SdxXHDw4nyPUs;    0000a0d05fb2deaefa2ba5cbaeb97a5df1ac8adb95e7c8fa472443737c4f192c mined by actor: <0.137.0> with performance metrics (since last call) : 10.8989898989899 and (total) : 9.567046859075829

2> Server mined Coin : mayurHwViZxcFSnJesHwVBMQ6v0PXkZitu9GSGS4IaKyQHUc;    0000b0a16204c09c6aba0af122087d0d8d17d96f131dc06c9e8453f1c3a25e01 mined by actor: <0.120.0> with performance metrics (since last call) : 12.285714285714286 and (total) : 9.56837713356814

2> Server mined Coin : mayurmUoc2PxDZvNpBF3QWXC6/DyCutMGsxpuC+3QDFwdWmE;    00003ec0ea8b6aa3b6ef81a94c8ce065d43cab30a6c6ecbbd0cc65c1dde4c8fa mined by actor: <0.91.0> with performance metrics (since last call) : 0.5 and (total) : 9.568273440547921

2> Server mined Coin : mayur3PAgOi0eeOUe5MjWzhqwShVQxmsXPDBEOjqXU7hF+FI;    00003e81189c7e47501b71b904230c1a329c25a247ed4e05338356cad713435d mined by actor: <0.84.0> with performance metrics (since last call) : 23.625 and (total) : 9.569584863951107

2> Server mined Coin : mayuru/HxXFykSA6BzE7v6hgvxCmIWp15xCHVk8nRSN3aXXc;    00004055f2036433bea887a4ed5bdd647bc0e8436547593aa745d86393678ff9 mined by actor: <0.147.0> with performance metrics (since last call) : 10.255555555555556 and (total) : 10.570345992292037

2> Server mined Coin : mayurZT1pb8rRBizXsZjWEmg/fNUb9qbR51jn/3NRwP2URjY;    0000176e6dbbda13f4be553ae23bc0db58289749045b56ecd02370b19495ecf8 mined by actor: <0.102.0> with performance metrics (since last call) : 13.7 and (total) : 10.572226250121739

2> Server mined Coin : mayurXx6XpaPUhk5EqRtxkuhL8q+eBAB2azXJWqVWlg8L50c;    000004baa743efc87cb09511f9b628b4f1f6e20e0dc64868f3dce2731dc885d1 mined by actor: <0.139.0> with performance metrics (since last call) : 9.614035087719298 and (total) : 10.572344728389588

2> Server mined Coin : mayurDvSyL/CgjSnLDXh1esvjNnFG7UcesTdBieRR+DLzYy8;    000010ba7ef867a86c3cea8781540a2171c09752d4794767a3bb4b336d230cfd mined by actor: <0.112.0> with performance metrics (since last call) : 13.846153846153847 and (total) : 10.573638801193617

2> Server mined Coin : mayurQCDEwY6wCFzXPbNYP3Xq8wlBRHl+0NgWG0+GDucGz1E;    00006cf34e59ea5dd415ee74ca8814605f09677de2918ab4d41fec239844e8f7 mined by actor: <0.166.0> with performance metrics (since last call) : 11.380952380952381 and (total) : 10.576599235734795

2> Server mined Coin : mayurAVyOZH7tSNZsuCk6oPatiG3iUt3M+ZyGD9qe1NELpW4;    00009a1659547ed2837da163e9cd3cb337efac437220b60434ec83afd59f73c5 mined by actor: <0.97.0> with performance metrics (since last call) : 0.5 and (total) : 10.57649586027483

2> Server mined Coin : mayurygDx5a/STJcQxZ4a2/TjuElUIPE3VTbCczvSwWvMqeE;    0000cd698c7c10fd3424e8f3decaafe946abd4f246baa5bcc256a07d6c5cba07 mined by actor: <0.114.0> with performance metrics (since last call) : 31.333333333333332 and (total) : 10.577997495790337

2> *** Terminating erlang (nonode@nohost)

Process finished with exit code 0

3. The running time for the above is reported by time for the above and report the time.  The ratio of CPU time to REAL TIME tells you how many cores were effectively used in the computation.  If you are close to 1 you have almost no parallelism (points will be subtracted).

    **Ans**. The ratio of total CPU Runtime / total Real Time we got was approximately around 10.5
at the time of termination of the program, but the trajectory was increasing and hence it might 
be greater than 10.5 depending on the time the program is run.


4. The coin with the most 0s you managed to find.

   **Ans**. Our application returns all the coins with leading zeros equal to the  input, hence all the coins mined will contain the no of leading
   zeros given in the input.


5. The largest number of working machines you were able to run your code with.

   **Ans**. The no. of machines available to us during testing the application was 5, but it could be more without any issue in performance. Around 10 machines should not be a problem as we use TCP/IP instead of the cookie system, as there is no need here for the connected systems to be using the same network.






