### JavaScript and IBM MQ

Basic JavaScript examples for interfacing with IBM MQ. 

The **<$>** means you are local and **<bash4-4$>** you are inside IBM MQ Server Docker Container. This was tested on Ubuntu Linux 20.04 LTS.


#### Requirements:

- Docker: <https://docs.docker.com/get-docker/>
- NodeJS: <https://nodejs.org/en/download/>


#### Instructions:

1 - Install IBM MQ container and it's volume: 
```
$ docker pull ibmcom/mq:latest
$ docker volume create qm1data
```

2 - Run the container:
```
$ ./run_container.sh
```

3 - Test if the container is working by opening the IBM MQ console: <https://localhost:9443/>

4 - Login: `admin/passw0rd`

5 - Disable IBM MQ user authentication (off course this is for testing purposes):
```
$ ./run_bash_container.sh

bash-4.4$ runmqsc QM1

ALTER QMGR CHLAUTH (DISABLED)

end

bash-4.4$ exit

```

5 - Clone this repository:

```
$ git clone https://github.com/aloula/js_ibmmq
```

6 - Install the **mq-mqi-nodejs** module:
```
$ npm install ibmmq
``` 

7 - Test connection:
```
$ node conn.js
Sample AMQSCONN.JS start
MQCONN to QM1 successful 
MQDISC successful
```

8 - Put a message in the queue:
```
$ node put.js
Sample AMQSPUT.JS start
MQCONN to QM1 successful 
MQOPEN of DEV.QUEUE.1 successful
MsgId: 414d5120514d31202020202020202020b01b286002d45323
MQPUT successful
MQCLOSE successful
MQDISC successful
```

9 - Get a message in the queue:
```
$ node get.js
Sample AMQSGET.JS start
MQCONN to QM1 successful 
MQOPEN of DEV.QUEUE.1 successful
message len=77 <Hello from Node at Sat Feb 13 2021 15:58:13 GMT-0300 (Brasilia Standard Time)>
no more messages
MQCLOSE successful
MQDISC successful
```

#### References:

<https://developer.ibm.com/components/ibm-mq/tutorials/mq-connect-app-queue-manager-containers/>

<https://github.com/ibm-messaging/mq-mqi-nodejs>

