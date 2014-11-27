#!/usr/bin/env python

"""
Generates autocomplete for ssh known_hosts file.
"""

import os
import sys

def main():
    path = os.path.expanduser('~/.ssh/known_hosts')

    if not os.path.isfile(path):
        return

    hosts = set()

    for line in open(path):
        line = line.split(' ', 2)[0]
        for host in line.split(','):
            if host.startswith('['):
                i = host.index(']')
                host = host[1:i] + host[i+1:]
            hosts.add(host.split(':')[0])

    hosts = list(hosts)
    hosts.sort()

    sys.stdout.write(' '.join(hosts))

if __name__ == '__main__':
    main()