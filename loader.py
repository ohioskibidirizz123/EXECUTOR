import os
import random
import time
import ctypes

# Open the command prompt
os.system("start cmd")

# Generate random 40-digit numbers for 20 seconds
start_time = time.time()
while time.time() - start_time < 20:
    random_number = ''.join(random.choices('0123456789', k=40))
    print(random_number)

# Print "connected to roblox client" in green text
ctypes.windll.kernel32.SetConsoleTextAttribute(ctypes.windll.kernel32.GetStdHandle(-11), 0x02)
print("connected to roblox client")
