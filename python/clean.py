import queue_wrapper
import message_wrapper
import time
import math

queue = queue_wrapper.get_queue("testing-queue")

h = 10

for i in range(math.ceil(10000/h)):
    messages = message_wrapper.receive_messages(queue, h, wait_time = 1) 
    message_wrapper.delete_messages(queue, messages)
