#!/usr/bin/env python3

VERSION_MAJOR = 0
VERSION_MINOR = 0
VERSION_PATCH = 1
VERSION = str(VERSION_MAJOR) + "." + str(VERSION_MINOR) + "." + str(VERSION_PATCH)

# seznam
# _Version
# _Info


# _Version
def Version():
    print("\033[92mversion: " + VERSION + "\033[5m\n")
# _Version


# _Info
def Info():
    # vypis verze
    Version()

    print("""\033[97m
Informace:
\033[5m""")
# _Info


# name_guard
if __name__ == "__main__":
    print("main")
# name_guard
