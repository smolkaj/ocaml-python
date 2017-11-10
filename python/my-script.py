from __future__ import print_function
import sys
import fileinput

# just like print, but use stderr instead of stdout
def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)

def main():
    eprint("[python] waiting for input...")
    for line in sys.stdin:
        eprint("[python] received line: \"%s\"" % line.strip())
        # reply (and flush immediately)
        print("Python loves you, OCaml!", flush=True)
    eprint("[python] input pipe closed; shuttind down...")
    exit(0)

if __name__ == '__main__':
    main()
