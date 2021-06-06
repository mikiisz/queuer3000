import queue_wrapper
import message_wrapper
import time
import time

queue = queue_wrapper.get_queue("My-test-queue")

start_time = time.time()

amount = 0

times = []

for i in range(10000):
    messages = message_wrapper.receive_messages(queue, 1, wait_time = 20)
    for m in messages:
        times.append(float(time.time()) - float(m.body))
    if len(messages) > 0:
        message_wrapper.delete_messages(queue, messages)

    amount = amount + len(messages)

print("--- %s seconds ---" % (time.time() - start_time))
print(sum(times)/amount)
print("Received %s messages" % amount)
