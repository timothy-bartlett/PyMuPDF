#! /usr/bin/env python3

'''
Runs a command three times:

1.  Run unchanged. This will use the default `fitz_old` implementation of PyMuPDF.

2.  Run with PYTHONPATH set up to use the `fitz` implementation of PyMuPDF.

3.  As 2 but also set PYMUPDF_USE_EXTRA=0 to disable use of C++ optimisations.

Example usage:

    ./PyMuPDF/tests/run_compound.py python -m pytest -s PyMuPDF
'''

import shlex
import os
import platform
import subprocess
import sys
import textwrap


def log(text):
    print('#' * 40)
    print(f'{__file__} python-{platform.python_version()}: {text}')
    print('#' * 40)
    sys.stdout.flush()


def main():

    args = sys.argv[1:]
    
    # Run with `fitz_old` (classic). We create a file fitz.py that does `from fitz_old
    # import *` and prepend it to PYTHONPATH. So `import fitz` will actually
    # import fitz_old as fitz.
    #
    d = os.path.abspath( f'{__file__}/../resources')
    
    # [Must not do `d = os.path.relpath(d)` because it fails on Windows if
    # __file__ is on different drive from cwd.]
    
    with open( f'{d}/fitz.py', 'w') as f:
        f.write( textwrap.dedent( f'''
                #import sys
                #print(f'{{__file__}}: {{sys.path=}}')
                #print(f'{{__file__}}: Importing * from fitz_old')
                #sys.stdout.flush()
                from fitz_old import *
                '''))
    
    env = os.environ.copy()
    pp = env.get( 'PYTHONPATH')
    pp = d if pp is None else f'{d}:{pp}'
    env[ 'PYTHONPATH'] = pp
    log(f'Running using fitz_old (classic), PYTHONPATH={pp}: {shlex.join(args)}')
    e2 = subprocess.run( args, shell=0, check=0, env=env).returncode
    
    # Run with default `fitz` (rebased).
    #
    log( f'Running using fitz (rebased): {shlex.join(args)}')
    e1 = subprocess.run( args, shell=0, check=0).returncode
    
    # Run with `fitz` (rebased) again, this time with PYMUPDF_USE_EXTRA=0.
    #
    env = os.environ.copy()
    env[ 'PYMUPDF_USE_EXTRA'] = '0'
    log(f'Running using fitz (rebased) without optimisations, PYTHONPATH={pp}: {shlex.join(args)}')
    e3 = subprocess.run( args, shell=0, check=0, env=env).returncode
    
    log( f'{e1=} {e2=} {e3=}')
    
    if e1 or e2 or e3:
        raise Exception( f'Failure: {e1=} {e2=} {e3=}')


if __name__ == '__main__':
    main()
