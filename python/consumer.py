import queue_wrapper
import message_wrapper
import time
import math

queue = queue_wrapper.get_queue("My-test-queue")

amount = 0
times = []
h = 10
f = None

for i in range(math.ceil(10000/h)):
    messages = message_wrapper.receive_messages(queue, h, wait_time = 20) 
    for m in messages:
        times.append(float(time.time()) - float(m.body))
    if len(messages) > 0:
        if f is None:
            f = float(messages[0].body)
        message_wrapper.delete_messages(queue, messages)

    amount = amount + len(messages)

print("--- %s seconds ---" % (time.time() - f))
print(sum(times)/amount)
print("Received %s messages" % amount)
