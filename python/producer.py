import queue_wrapper
import message_wrapper
import time

queue = queue_wrapper.get_queue("testing-queue")
for i in range(1000):
    message_wrapper.send_message(queue, str(time.time()) )

