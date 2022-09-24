# SecureHash
DOSP Project 1.

Group members - 

Mayur Reddy Junnuthula (UFID - 36921238), Akhil Srivatsa (UFID - 80826297)

Project Description

**Steps to run the project** - 

1)  Build the project and run it using the erlang console configuration.
2) Start the server with the command server:start() in the console.
3) Server/s Implementation
4) Enter the number of leading zeros which should be present in the hash string for mining.
5) This will start the master/server and will start mining the coins.
6) Client/s or worker/s Implementation (Distributed)
7) Enter the server’s IP address where the master program is running.

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
servers.

Project ReadMe Questions/Tasks: 
1. Size of the work unit that you determined results in the best performance for your implementation and an explanation of how you determined it. The size of the work unit refers to the number of sub-problems that a worker gets in a single request from the boss.
A.


2. The result of running your program for input 4
A. (temporary answer, until 4 laptops are used)
"C:/Program Files/Erlang OTP\bin\erl" -pa "D:/MS/Distributed Operating System Principles/DOS Project 1 A/SecureHash/out/production/SecureHash" -pa "D:/MS/Distributed Operating System Principles/DOS Project 1 A/SecureHash"
Eshell V13.0.4  (abort with ^G)
1> server:start().
Enter the input (Number of leading zeros if you are the server or The IP Address of the server if you are the client)"4".
{4,<0.79.0>}
2> accepting state....2> Server mined Coin : mayurzBar4SnEojCyYn48QLFciIV6qkvNuFsUhb7eUM2HfQU;    0000c65c54dc114f6cbf32fcc0aedbde7d25f97a4972008804f77290baf1d19e mined by actor: <0.105.0> with performance metrics (since last call) : 0.03982118294360385 and (total) : 0.03982118294360385
2> Server mined Coin : mayurgqsdFNYoenQjSj8nacZl7JxfKgmAOCg9b3EhLUgxNsM;    00002095c1244f3e025c23a68560d6581f31a46ae988b18a77942e324b81b0c4 mined by actor: <0.94.0> with performance metrics (since last call) : 13.404761904761905 and (total) : 0.07825252040326452
2> Server mined Coin : mayurHOJVNew/bJ8hfyzlbRP0TdmvhxMWjJ5DceaN68lZVkU;    0000e872a5ac0c8134b5d09ef17fee4d948a701b5b5dae0cfba7dfb13bf79926 mined by actor: <0.178.0> with performance metrics (since last call) : 11.313253012048193 and (total) : 0.1417854463615904
2> Server mined Coin : mayurTTeq/r+eIUkBFuot0lyZaOOJzzNHN/SSzuk2zpOnb/A;    0000d741b9c1d85cf529fae20c74d0bf8065263ad98d7be21fc94250ab931081 mined by actor: <0.125.0> with performance metrics (since last call) : 12.533333333333333 and (total) : 0.15439122436465216
2> Server mined Coin : mayurPlQ3C4F8z3KG4kPwFt+VWBkAba0zjAZY6jYA6mSkFYU;    0000b6348eea89cec9ea5fdbad8badd58582cb172f8d0cc47b87bca872ae0740 mined by actor: <0.85.0> with performance metrics (since last call) : 0.08333333333333333 and (total) : 0.1542755991285403
2> Server mined Coin : mayurfJ1LznNd/TyOoWM4KbDx0IaXm1HW2omez+Pt1pUs1B8;    0000a9e7252a7696c28432bae9889c0d913c58a192e2c4ecdbe5409f3d4cecb8 mined by actor: <0.151.0> with performance metrics (since last call) : 27.0 and (total) : 0.16700694160881993
2> Server mined Coin : mayurqhpBdX+7TytPWDSskEg6O86QoiZ7jpv9Gpkb7B7/4b4;    00006f93baf608034bc68d88c57d5de8bd4f8395a2cad902d0ea0d7212f1e864 mined by actor: <0.173.0> with performance metrics (since last call) : 11.393939393939394 and (total) : 0.19210919462175743
2> Server mined Coin : mayurLA9KG8QvGfiphpBS9QetBeiAV2wnwSsXufegjMrYzOE;    0000fb745381d9f579aae0c668606df4a9790000a4c5a21e2f1bfd6fc4ae4b2f mined by actor: <0.102.0> with performance metrics (since last call) : 10.444444444444445 and (total) : 0.20457166112731465
2> Server mined Coin : mayurIROvbGUlMVwOFy1IBzHbzjJxd9YiCvW04My2UnMUqbw;    0000f457c0168cc0979e054044ab869df93c2e843a105ea71fdc143859dfcd34 mined by actor: <0.104.0> with performance metrics (since last call) : 9.64102564102564 and (total) : 0.22941614234490224
2> Server mined Coin : mayur5FbRQ4dELa2mHwTlIdorp4TPMDNi57Bz+rqnDzcxSVU;    0000486e1a4a629f4e9ed3c05c06118f5c238ddc2c4ba4b6083bfb0d0b6ce09f mined by actor: <0.105.0> with performance metrics (since last call) : 11.510204081632653 and (total) : 0.2666396924944366
2> Server mined Coin : mayurCqVWCMqt7QOP86BBnUvTA5KZbBtVl9XPbn/5eb/1ex0;    000052e9a61c8bc8905a126d053688a42d1b159478460fe417300c7a108adfdb mined by actor: <0.143.0> with performance metrics (since last call) : 12.043290043290042 and (total) : 0.44724085264625807
2> Server mined Coin : mayuryWyXN9NkWK8m1QmgFMQllcQZ7cAlcmlCbI8kSApNQ2c;    0000f3880f1f715de893202f7db06daa1fde17fc3b26db405daaa7ec09f671b4 mined by actor: <0.107.0> with performance metrics (since last call) : 11.608247422680412 and (total) : 0.5186407126360937
2> Server mined Coin : mayur2Zmwvu9rgJYnqFZvusSBKmhqU8l8vGUo4cl7Qvq0qps;    000067de644e9201bd1f43f8593172e68dbfd25652cc7d22cd06bae5f83f047d mined by actor: <0.156.0> with performance metrics (since last call) : 12.533333333333333 and (total) : 0.5304898147537741
2> Server mined Coin : mayurmSBY8lydg5gmSlcd0JtDZhtASoja0W0R9CrMw0Kt8dc;    000080129345e6cc85dc8bbeee2deeb3377a8a5c9f56fa06a319243c6586a1fa mined by actor: <0.100.0> with performance metrics (since last call) : 0.3333333333333333 and (total) : 0.5304198800342759
2> Server mined Coin : mayurcIM0Srb4RC/xZSyUCTEB6Xl16U2DuEo7pGv0o2mMkWE;    000011bbb31208ed559484e75a84fab1f05d3ade15aaed18c70553bd4d14ebc6 mined by actor: <0.166.0> with performance metrics (since last call) : 31.5 and (total) : 0.5426331049024776
2> Server mined Coin : mayurl376TLsBpxizTxgiZ+ZTaR+P9eYkUKBWfIcXDsjp/XY;    0000b8897cdeddce421044872314caced925778767060a2dc9a3b0ca0c655670 mined by actor: <0.108.0> with performance metrics (since last call) : 11.26 and (total) : 0.577799671592775
2> Server mined Coin : mayurEBOjyonzTpbRypYKq6zJ7lnRDLRBGiXa5vAV2uImY14;    00002118b870ab666bf621e648e4a93b0cca912bc9ca7405ae93aa4208050e51 mined by actor: <0.106.0> with performance metrics (since last call) : 12.689655172413794 and (total) : 0.6237403481219735
2> Server mined Coin : mayurfQy+7x2KF1YBuxuwpsMIJhb/s2Ysx8cgmFuqETAqyt0;    0000a2c4e0f687ffa048b0021fcc5a0f2c66ac26c94a2746a3935718fad0074c mined by actor: <0.103.0> with performance metrics (since last call) : 8.625 and (total) : 0.6446054435089094
2> Server mined Coin : mayurG+Hj3VGGFvXKm3WIegw2Auz0Q/6IWjs4/R6x4axWgpM;    0000e6b3130df99e6a3209b56fea8821b2c7cc64616b35e2007538234b00dcbb mined by actor: <0.166.0> with performance metrics (since last call) : 13.341463414634147 and (total) : 0.6784714536814009
2> Server mined Coin : mayuraTuSN9m9LmwQPc8kHQqQewmlqRF7ztxpMPIiiPpdtHw;    000010aa81697450819130c86b301ab77ee4919513b3fc0ec72883f83cb17796 mined by actor: <0.91.0> with performance metrics (since last call) : 9.98936170212766 and (total) : 0.7350847676976835
2> Server mined Coin : mayurB/euQdAod2ROc9V8j6KlHwnRWEOco4B4f9DYZtHbTxg;    000041e42f5c8be700c083d8dc92c885a65479bc7e8582351ee89a9c7cffe94f mined by actor: <0.155.0> with performance metrics (since last call) : 12.207317073170731 and (total) : 0.7956227872545865
2> Server mined Coin : mayure63LoIU3f9wQ9QjJs+COEWPTX15Y3jRQlRSNf8+dz0g;    0000a44edaf680706477fe89ee151fb0c6ff1e71e3ff2337fb01d636f1b5f7b4 mined by actor: <0.177.0> with performance metrics (since last call) : 11.06832298136646 and (total) : 0.9009875756610386
2> Server mined Coin : mayurFCYyel3jK9ZfY2tUktFL44ZIPErz05AXhk28EQfHCwY;    0000a00338faff5253a102e2393dc356fb31f38d996ef6611a2ed831051a2172 mined by actor: <0.118.0> with performance metrics (since last call) : 11.610294117647058 and (total) : 0.9929879974731523
2> Server mined Coin : mayuraRuZQ04dUmC0VcckqUJIFzprUOgfTEPotrk762CAIHk;    00006343abec97a62e0622fe9f40b110c392a8b18a206ab43603c75b43380eea mined by actor: <0.107.0> with performance metrics (since last call) : 10.538461538461538 and (total) : 1.0242428058686481
2> Server mined Coin : mayurzUcw87jjIYXA55R3XwGKpLK7J+TmT7qMvOBeB9fLnQs;    00006df5cab699646164b11c7e092a0efabe92cbe8a5e4021e12db29b1d2cb76 mined by actor: <0.107.0> with performance metrics (since last call) : 12.6 and (total) : 1.0351682919156968
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
2> Server mined Coin : mayurGD3giY4X6fK4iFjGnTpieNncJPiTRA6SRUTKbQCxO3c;    00007512a3aa913c343c1a9d44edc0391f7519b07fa0655c47820fe020ae916a mined by actor: <0.139.0> with performance metrics (since last call) : 12.533333333333333 and (total) : 5.4828546625189905
2> Server mined Coin : mayurNYmRvnWUq9m21026Pm0fk7Xt9XlaAnK3ZzHJku52nH8;    0000597883483c35f0dd243993730feb065f45b7705590495929f203f4e12a12 mined by actor: <0.163.0> with performance metrics (since last call) : 0.125 and (total) : 5.481466748634868
2> Server mined Coin : mayur4D0VRovmTldnYcH8de8IWoPYcLp7Kyzk4GZZeUbjNFs;    00004b02fba4a4560409aa47255c88915cd5a8cf460faccd532b8f169c29139a mined by actor: <0.140.0> with performance metrics (since last call) : 13.047619047619047 and (total) : 5.493103199248935
2> Server mined Coin : mayurflo9E2BSSvaQaCxcnn9d9+SRFJ0a5ohieSvUykRT6dA;    00007aeee8863124a229c8a9a501fedf4bcfdd21ff2211d603f5c18b53ea7348 mined by actor: <0.151.0> with performance metrics (since last call) : 10.697986577181208 and (total) : 5.521119172473242
2> Server mined Coin : mayurK0m3dWKa5cmvXixtjB+l+yNHxZepxM8bbcam5o32dEs;    0000b3db11e7165b5d79e388e80f8e48f0d4878a77b7a0920fee34f96cc3b114 mined by actor: <0.117.0> with performance metrics (since last call) : 24.714285714285715 and (total) : 5.526106004021833
2> Server mined Coin : mayurkmWZslb3G+3dK0/70BavYdjsyfBA6F7amgwfluoZmOM;    00009060f0d4ccb2f03ab45f623e3b74752dda1273fce339de9d64c0818f90d3 mined by actor: <0.149.0> with performance metrics (since last call) : 8.722222222222221 and (total) : 5.528333034272385
2> Server mined Coin : mayur0LPf+qSsauabv59/774/m2BegyeeagdAgNPkNWKLYcE;    0000d97779832a0bda3dac55ec188385f4b97417909fe8fbd3dc58b519667079 mined by actor: <0.99.0> with performance metrics (since last call) : 12.533333333333333 and (total) : 5.536029253602925
2> Server mined Coin : mayurl/1Vt5xABrr/Qu1XGvOlRlF4fWprhC62t5K6w/xlCaE;    00006afaf9d8ce1e1f86fcdaa58f4672d9a0358f2eb4f15ad14f0f200f783dff mined by actor: <0.136.0> with performance metrics (since last call) : 9.61111111111111 and (total) : 5.538819820142596
2> Server mined Coin : mayurCdiHjeKIlX4WlmSf/kqkA0TQYWF9aiRc6CEndVyXyBQ;    0000a9f1a8c4d8a0122f6031386ef5874a45a726854bf6fcefa938a92acc16e3 mined by actor: <0.96.0> with performance metrics (since last call) : 10.5 and (total) : 5.542179891148668
2> Server mined Coin : mayurOohN2/pSrpkD5aIfMNea3c31qIoqRBCvnRpdE4jCY6c;    000018966957252ee6f54f11fa4d066d9addab199d2673e6bd37c0ce9a76b451 mined by actor: <0.124.0> with performance metrics (since last call) : 13.333333333333334 and (total) : 5.549867639693782
2> Server mined Coin : mayuruUtzzZJ9f7J3Wv8WTmV1jhv48ImbmrIHFpj2OmNwDxc;    0000aa2173bc81f1a97ebc62dd7b63fdc08cf6ab9b61d91f5a1bd4fe89da42ef mined by actor: <0.129.0> with performance metrics (since last call) : 0.2 and (total) : 5.549073610415624
2> Server mined Coin : mayurraAhUNaCgRVP0o9m4Hv/yfdGXblS6mIaUeXrsXoJ9PI;    0000c26dc01dfd766aec013c1bf6eb4c40e1735fd8a62285ff37a1b359c2d7a8 mined by actor: <0.101.0> with performance metrics (since last call) : 0.08333333333333333 and (total) : 5.546891200972505
2> Server mined Coin : mayurxYu1MjqOAOerW59PMg8Mf5Ream3KktsumVo+Hk2xmXo;    0000d622cb8a676c74af2c7dd92c163e5b313d2b8bc80f3f74890fa527524fd3 mined by actor: <0.100.0> with performance metrics (since last call) : 12.144736842105264 and (total) : 5.564933675652546
2> Server mined Coin : mayurbN0FWsNK2G1DWuZdXEtEftahVK3/gp8PAyB5aVVHU/w;    00003b4d66a8874336026c51a7c1d005cbc519591a21ae3ae83db219fe933b15 mined by actor: <0.126.0> with performance metrics (since last call) : 21.625 and (total) : 5.569676660368614
2> Server mined Coin : mayurfP8gyHZfSgU03oEypZ+acYocO6VU3Oa16hgmGwZZznw;    0000b7a688157dd6d606fae3ae69245f690655cbda329762c427e19275068436 mined by actor: <0.158.0> with performance metrics (since last call) : 11.936363636363636 and (total) : 5.594708806818182
2> Server mined Coin : mayurNgRuDY7l36qz1IEDE2SifULvX1xcTscSX+vJuShD8zM;    000035b4bfb7301509e245485553a7044eca154a58046c19234a0d60644ef94c mined by actor: <0.105.0> with performance metrics (since last call) : 12.033333333333333 and (total) : 5.601724076767534
2> Server mined Coin : mayurmZwfAoNNPpJcKAAHoNo6e/ujrNW09OhTwK+ufcCbtNI;    0000fc426e506a0a90e6e0a7dfd4327ce726a4934fa292c0a7463c7344cfc611 mined by actor: <0.115.0> with performance metrics (since last call) : 6.653846153846154 and (total) : 5.602856737789749
2> Server mined Coin : mayurosqEFqyrMSSF23P8Tn/WfDU1l2l48dnHCGqKsSqCP/o;    0000baec152565692eebe3a14ca597ecfe519c86fda19de7078f0226546fe3b1 mined by actor: <0.150.0> with performance metrics (since last call) : 12.36046511627907 and (total) : 5.623555602671472
2> Server mined Coin : mayurUMoHPh9/XREKUsF+pcISjN0s3Tx81UCulQp92rGLKeA;    0000d162f256adac4c71d1f0a99bf9d4f1b80c89c060d16e45929e9574d5774d mined by actor: <0.123.0> with performance metrics (since last call) : 11.357894736842105 and (total) : 5.642904941358785
2> Server mined Coin : mayurHmCF3+5Vw6FFvW6TMdPRF2geWRU3VWe9wQsUzf+VcFk;    00006980a5b389de8c880c5d3c4448e97cee9cb9ee0bb6270cee32e63e45777c mined by actor: <0.177.0> with performance metrics (since last call) : 11.058823529411764 and (total) : 5.649546190107648
2> Server mined Coin : mayurT1f2xmR9LQ+gBs2HuYYQcR1hlG62YvIgnDYmeAtKzrA;    0000fac3f787e70e5f253a7cf55264906d9c9b516279e4f7ac2633d069949e3f mined by actor: <0.166.0> with performance metrics (since last call) : 9.813333333333333 and (total) : 5.660666666666667
2> Server mined Coin : mayursdpa5V5cwgnfgx1GbugGStuFGxoW4EHGi0e6bCu6Gd8;    0000247824782af944cd935681ba063e7c55e692b8a76e44500d327d081041a9 mined by actor: <0.147.0> with performance metrics (since last call) : 37.6 and (total) : 5.666432781364019
2> Server mined Coin : mayure7QB0v7MnwyA3iYvPFsTxLb0HugouzQt523CgBPQJ2k;    0000a86738530539160fb48336005aa28d80e22cad42fe5b7b313878db4fb0ef mined by actor: <0.93.0> with performance metrics (since last call) : 9.724137931034482 and (total) : 5.674836315255068
2> Server mined Coin : mayurMvWf38BTQpEuNbngVMui8n2/S/A6ftFIAZBWI9DmwVM;    000000cd86c3e5c8704c90757b35a28362c1b328c5420febb605faabe015e05c mined by actor: <0.97.0> with performance metrics (since last call) : 14.72549019607843 and (total) : 5.691132781098179
2> Server mined Coin : mayurlQDEJy7mZgk7eNMEVyUMDb3ZlHa0VNGxtlerzg8XLjo;    000005df8cdb43710847d4c02aaa6fce957971310d8ccc5f9160019a83ac6203 mined by actor: <0.92.0> with performance metrics (since last call) : 8.225 and (total) : 5.694834205933683
2> Server mined Coin : mayurw9G4AOMPwwisJTaXqlKqwzV/I8lpC8lKh8y68ncuUt8;    000072ca380b30fd559e0c46ef2a3ffa23e7c9b7f0f95f71714cb33ae99553bc mined by actor: <0.129.0> with performance metrics (since last call) : 11.129032258064516 and (total) : 5.700871687587169
2> Server mined Coin : mayurzYmtXbbrcuBuE8bkbBum5fxABo8iKvacVw/RGziGcv8;    0000cdea65f95bd8f1b9770f5b641146f688b95a7bfec32f16839c02ddf8d8fa mined by actor: <0.158.0> with performance metrics (since last call) : 10.857142857142858 and (total) : 5.709830130882763
2> Server mined Coin : mayurlEDp7RXjd8wD0YrfhUe5H4xb2loJg2rszqwCudoRl8g;    0000b885e4fd5ee4c37a0e1d6edd4d5d4fbba30c9651387a6ea0031d96172542 mined by actor: <0.141.0> with performance metrics (since last call) : 11.368421052631579 and (total) : 5.750863975670445
2> Server mined Coin : mayurbS0ZevFAJrfQVCtgB/0IBvkOnevnpQ26aQq4CYo/gQo;    00002509fd2906e4a921381792a7a866d2161a11b4f45136d1835a7ab160ea1d mined by actor: <0.166.0> with performance metrics (since last call) : 13.404761904761905 and (total) : 5.762121682713876
2> Server mined Coin : mayurRcGjm/uMlFEhmj8bldBgZ95Ly7DV4CDgOFkQ6uWXCcQ;    000001e9cf9e60a7e027cf46fca1180aa64d4c99ac8d81ee8eaed1de23353870 mined by actor: <0.158.0> with performance metrics (since last call) : 0.14285714285714285 and (total) : 5.76092882034296
2> Server mined Coin : mayurE8EF9t6Yv9y0IbNQLtH52sRL5CZl7OrI24shCYxcZGI;    00009a6ab0688ac95d1c7e91185d6a93db8c2ad9219c2607079e19910e896767 mined by actor: <0.88.0> with performance metrics (since last call) : 16.347826086956523 and (total) : 5.769488019307016
2> Server mined Coin : mayurTcBuffIEbcRhVwLvjHTEug5pl4IeTo+msP8MQk4f1bU;    00004653108328ef82f82d755edf6bcb6d4b2c9b60ddc8028bf566f79e0f39a0 mined by actor: <0.127.0> with performance metrics (since last call) : 12.203389830508474 and (total) : 5.782713415683171
2> Server mined Coin : mayur9utMMFyjXiGsG8D8e3r0BgZCAAzdNOE4+2eEhAIypJI;    00005dd7a359ec62bc7a26e99170d3031ed8b103595a141bb264f255189990c9 mined by actor: <0.118.0> with performance metrics (since last call) : 0.25 and (total) : 5.7821165623064745
2> Server mined Coin : mayurSZuAANQSYnIJlTgRfkvbIBVk17Eqj1kdFrt28aX20Fo;    000095b6b85a90e59132a0e2959c6ece7be9b7467490d6df0c1a1674fc0a224b mined by actor: <0.92.0> with performance metrics (since last call) : 11.565217391304348 and (total) : 5.791419051217753
2> Server mined Coin : mayurv030w10GwuX2ji5yFDfgVTUMggA45z+V9TFYWpu798k;    0000e11b82083a341b1547cce387433c7bf820bf2b8be2bd9bcaf79bfce9a2ae mined by actor: <0.102.0> with performance metrics (since last call) : 0.09090909090909091 and (total) : 5.789430308025136
2> Server mined Coin : mayurwEVwqpP6vqIJgldqJ78dx+KItI0cJjv/gdIarJ8Z2y4;    00000eacf4069bc8e84faac5b1aeaa4d2126f15faf15b26d949eca03e0c7bb5c mined by actor: <0.95.0> with performance metrics (since last call) : 0.3333333333333333 and (total) : 5.789032723277135
2> Server mined Coin : mayuriDPjuW1loj/YyzXsWaOxZxa3g6FgGlM8KFcpSmE4GZw;    0000b93b70c17a76453c1bc0123ea1023bf402a2188d4a1e6079159cfe71c7c3 mined by actor: <0.130.0> with performance metrics (since last call) : 12.162393162393162 and (total) : 5.814699545128082
2> Server mined Coin : mayurYA71Jl9gQlhWT5DTZgXAbcrf1XFo/lgG7giwpQEp23w;    00009dad97c1b8e54ee991c62efde86865e5d01e66b14b99cb7fc04867916ac8 mined by actor: <0.118.0> with performance metrics (since last call) : 10.077777777777778 and (total) : 5.827945990180033
2> Server mined Coin : mayurGjn7Tlz4ZkBjhgXspvM0ktIpQhZK23isyghq4B6S16g;    0000da2f998078a5f7230061abad64216f677171914c51905b1afa68bdc8e302 mined by actor: <0.93.0> with performance metrics (since last call) : 15.714285714285714 and (total) : 5.835184680387079
2> Server mined Coin : mayurrQyOTtPGAezU/6vze7oat2UI06+byofndY0H3bzLKQ8;    0000fffc021ff74870635433d01d2cc7dbd1dbc8faf3288fde6b67ed13ee2697 mined by actor: <0.117.0> with performance metrics (since last call) : 9.894736842105264 and (total) : 5.837975890485596
2> Server mined Coin : mayurAuO1QcyKWLzr1sVxONzv2XBiN9HuPHlyBUexZFywG90;    0000e93abf7a84d86840b04fff65a54bbbc79169dc7f40a52a1b416fc9f1c9ab mined by actor: <0.161.0> with performance metrics (since last call) : 10.148148148148149 and (total) : 5.846051871239675
2> Server mined Coin : mayur7hHvAp6esglHSoPRaH0R6eLilk+S23UL56x9paUU578;    00006f3512d9a350ae064ea88ef82c039cb5fbce60b15c0c21edd19ac8e1db58 mined by actor: <0.100.0> with performance metrics (since last call) : 12.584745762711865 and (total) : 5.873137865655472
2> Server mined Coin : mayur/rBZmLudu7EEbNcUdXuMDZ5S3g7a0sS+DfXAdhZTFIs;    00003d4d03e5cd96a7cd311ab360d2c266af935f93ce12308dab0ae42dfd3acc mined by actor: <0.143.0> with performance metrics (since last call) : 10.140845070422536 and (total) : 5.883537120853881
2> Server mined Coin : mayurmctI7U0H+CReogFpwpwAdWYEpl1E0nTh/ZMfKvKMVu4;    00000c4e8b7b97bfc19c33d9166b1305d1dd1f309512373c889045a6a68c5742 mined by actor: <0.171.0> with performance metrics (since last call) : 12.533333333333333 and (total) : 5.890433608908386
2> Server mined Coin : mayur2QdNANLyXhwj6LiUQb67XqjkG0V2N+/5izdNK0wVp78;    0000ad888c81cd619bd508ed7f08e37ed4524c2daac4e3e1e16de4f8e96ca41c mined by actor: <0.93.0> with performance metrics (since last call) : 10.891304347826088 and (total) : 5.898349056603774
2> Server mined Coin : mayurix7heT+oNhSn/NfUji9da3JfAWon11hlVKdVkkWrDTI;    000086369ae7f65c0ad639a6d474c1c82b669e997a0f98a76ba2a6acbf8b6568 mined by actor: <0.141.0> with performance metrics (since last call) : 11.93956043956044 and (total) : 5.935333712869629
2> Server mined Coin : mayurea/heuF2rJB3d+tOuPCj2Ymjb44xibDc6iwMamjKgLk;    0000ec5d2bb25a8c7853ee4d5a6335f43daefc0aa37dd8d81d91c606968c0aeb mined by actor: <0.154.0> with performance metrics (since last call) : 0.08333333333333333 and (total) : 5.93314809855383
2> Server mined Coin : mayuryAe4YPgaXsi+h6ZQu7IeQ2Njn56zfEMZhTvpqjcZYRI;    000041454848a27ed9fd6d8871561cc3b434b36a82f3156218090b36674a0ea2 mined by actor: <0.94.0> with performance metrics (since last call) : 12.5561797752809 and (total) : 5.97254484342241
2> Server mined Coin : mayurCV7L54CfSJtmM0K/JhAGWaJOIO2jAhUM2UrzZ8w1ndo;    000008b0d9bce416bc17009b6418286068cbeacdccdaa89e4e221e528b97d378 mined by actor: <0.152.0> with performance metrics (since last call) : 7.208333333333333 and (total) : 5.973696461824954
2> Server mined Coin : mayur6Ou7p6CRtz+0cQNdrdjY37BPpJKNcs/xbEwQZWWhPdU;    00000a24a0adc2c51a21ff8f92a4a754478f4f6002d0dcdb355d4eedcfe0b783 mined by actor: <0.142.0> with performance metrics (since last call) : 11.391304347826088 and (total) : 5.99038557172695
2> Server mined Coin : mayurJLvq+sZAEqRRecwq+GtriiMAq4upqDSMUoc3drLFtYE;    000064326250dd042f1b96a1b2b0a0a2fc418fd37df14396cd912dc0970c07eb mined by actor: <0.127.0> with performance metrics (since last call) : 10.488636363636363 and (total) : 6.003636363636364
2> Server mined Coin : mayurgonmgtYkoj4gYltdgD8E5CJIQRslxMwNzoLer5/0QQM;    00006252b106ef22121430f985e461ce3102bd12069bad6c2e1b3e50aa945f8c mined by actor: <0.100.0> with performance metrics (since last call) : 12.303370786516854 and (total) : 6.022282286241677
2> Server mined Coin : mayurW3SWdvlyltU7xN9HsLBM6LirkwnLpyhz357V7q352OY;    000053e2498f0795d2a87d1a189fb2dcbc85504dcc9cdbaacaf804ccc6835845 mined by actor: <0.119.0> with performance metrics (since last call) : 11.058823529411764 and (total) : 6.025268498385715
2> Server mined Coin : mayurbvCwgqkktmF6wXp10Qw+DkLdX3uR61avB4PInnj6Wm8;    00001b2dcfa2044645e24635f12a99a6f9cade03a1925f8b790238473b175beb mined by actor: <0.128.0> with performance metrics (since last call) : 0.5 and (total) : 6.025070004941525
2> Server mined Coin : mayurVjFwJr1cX4mxxlXF9e03goAaZ1P4JdYc1t9G5r+Z3Fk;    0000fa5a710d289fd75efc6eb295a783cbbca4d4afee9652d4fd57c8f8fafda4 mined by actor: <0.162.0> with performance metrics (since last call) : 11.208955223880597 and (total) : 6.036652312547254
2> Server mined Coin : mayurbbGchMbZbT0NItj/Te2m+TGrHGtj1YC17wYTYZCnrE8;    00001ef21bf29c3783f0d55c36a9c8c57984b20b544e50638b00897af0978876 mined by actor: <0.108.0> with performance metrics (since last call) : 28.833333333333332 and (total) : 6.041313350423979
2> Server mined Coin : mayurp+WQmcfomeSwsdOZE4uF//b3yoRYGy8jYIlYfTpsv3U;    0000c1a64c078db6492b042f1a87109d672ec36c565441a1d05f83ffe3d858f1 mined by actor: <0.104.0> with performance metrics (since last call) : 10.434782608695652 and (total) : 6.051419951465862
2> Server mined Coin : mayur1Se5JZ0cqS+UCocvNrU3IrkcUUw23HJeiczrQM3kb3U;    0000b7ef023d3e6d6c148423c04626cf21838f6e39f96b06da9b91d7e3382ef2 mined by actor: <0.125.0> with performance metrics (since last call) : 10.64 and (total) : 6.059097010771699
2> Server mined Coin : mayurpnpytTNP+O/pJqBwuRJW3terWe2ySmRN0T6CJpjvbM4;    00002cd99d562408b4bd6382b25c6b287f2b468000f2f92926b9892c5018828a mined by actor: <0.179.0> with performance metrics (since last call) : 11.909090909090908 and (total) : 6.076069213189683
2> Server mined Coin : mayur2jqYs3iVbr6/m6rU6ve0SEYC052tbo6wu9gmSCGp/n0;    0000d613da001f87482adb862ae7d37916697ce5fb88ea54c456569de694676d mined by actor: <0.109.0> with performance metrics (since last call) : 11.5 and (total) : 6.0815421246616
            |
            |    so on...
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

3. The ratio of total CPU Runtime / total Real Time we got approximately around 10 
at the time of termination, but the trajectory was increasing and hence it could 
be > 10 depending the time the program is ran.

4. Ours follows the == equality (not the >= equality), hence all the coins mined will contain the no of leading
zeros given in the input.

5. The machine available to us during testing the application was 5, but it could be more without any issue in performance.






