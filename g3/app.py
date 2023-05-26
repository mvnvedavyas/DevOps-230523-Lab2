import os

print("\n\n\nThis is app.py from g3 assignment.")

print("Current user ID:", os.getuid())
print("Current group ID:", os.getgid())


try:
    os.makedirs('/test')
    with open('/test/test.txt', 'w') as f:
        f.write('Test file')
except IOError:
    print("Failed to create/write to file in read-only file system")


try:
    import pandas as pd
    print("Pandas is installed")
except ImportError:
    print("Pandas is not installed")