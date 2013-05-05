#!/usr/bin/env python

"""
setup.py file for SWIG example
"""

from setuptools import setup, Extension


festival_module = Extension('_festival',
                           sources=['festival.i'], 
                           swig_opts=['-c++'],
                           include_dirs=['/usr/include/festival'],
                           libraries=['Festival', 'estools',
                           'estbase','eststring','curses','asound']
                           )

setup (name = 'festival',
       version = '0.1',
       author      = "James Ravenscroft",
       description = """Simple SWIG wrapper for festival speech synthesis""",
       ext_modules = [festival_module],
       py_modules = ["festival"],
       )
