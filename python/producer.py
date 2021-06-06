import queue_wrapper
import message_wrapper
import time

queue = queue_wrapper.get_queue("My-test-queue")
for i in range(10000):
    message_wrapper.send_message(queue, str(time.time()) )
~                                                                                                   
~                                                                                                   
~                                                                                                   
~                                                                                                   
~                                                                   
