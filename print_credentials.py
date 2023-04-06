#!/usr/bin/env python3

import sys
import os
 
# printing environment variables
# print(os.environ)

# home_dir =os.environ['HOME']
# username = os.environ['USER']
# print(f'{username} home directory is {home_dir}')

print('Number of arguments:', len(sys.argv), 'arguments.')
print('Argument List:', str(sys.argv))
print(sys.argv[1])
