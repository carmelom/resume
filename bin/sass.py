#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Create: 08-2019 - Carmelo Mordini <carmelo> <carmelo.mordini@unitn.it>

"""Module docstring

"""

from scss.compiler import compile_string

import argparse
parser = argparse.ArgumentParser()
parser.add_argument('INPUT', help='Input file')
parser.add_argument('OUTPUT', help='Output file')
args = parser.parse_args()

with open(args.INPUT, 'r') as f:
    S_in = f.read()

S = compile_string(S_in)

output_S = f"""<style type="text/css">
{S}
</style>"""

print(S)


with open(args.OUTPUT, 'w') as f:
    f.write(output_S)
