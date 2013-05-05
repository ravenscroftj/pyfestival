pyfestival
==========

A native binding to festival TTS system for using SWIG

## Dependencies

PyFestival links against the Festival libraries and libcurses. However, it
relies on a patched version of Festival (I won't go into details here because
the blog post
[here](http://r0bertz.blogspot.co.uk/2007/11/myths-about-stardict-301s-text-to.html)
really does cover everything you need to know about why. 

** Note: If you don't use festival with the patch, pyfestival will SEGFAULT
when you run it. I am trying to figure out a more convenient way of running it
without forcing users to rebuild their library.**






