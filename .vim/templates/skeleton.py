#!/usr/bin/env python3

VERSION_MAJOR = 0
VERSION_MINOR = 0
VERSION_PATCH = 1
VERSION = f"{VERSION_MAJOR}.{VERSION_MINOR}.{VERSION_PATCH}"

# seznam
# _Version
# _Info
# _main


# _Version
def Version():
    """
    Vypis verze prislusneho scriptu
    """
    print("\033[92mversion: " + VERSION + "\033[5m\n")
# _Version


# _Info
def Info():
    """
    Vypis napovedy k pouziti scriptu, funkcnosti atd.
    """
    # vypis verze
    Version()

    print("""\033[97m
Informace:
\033[5m""")
# _Info


# _main
def main():
    """
    Zakladni funkce, volana pri primem spusteni scriptu.
    """
    print("main")
# _main


# name_guard
if __name__ == "__main__":
    main()
# name_guard

