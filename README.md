pyfestival
==========

A native wrapper for the [Festival TTS system](http://www.cstr.ed.ac.uk/projects/festival/) for python using SWIG.

## Dependencies

PyFestival links against the Festival libraries and libcurses. However, it
relies on a patched version of Festival (I won't go into details here because
the blog post
[here](http://r0bertz.blogspot.co.uk/2007/11/myths-about-stardict-301s-text-to.html)
really does cover everything you need to know about why. 

**Note: If you don't use festival with the patch, pyfestival will SEGFAULT
when you run it. I am trying to figure out a more convenient way of running it
without forcing users to rebuild their library.**

To get Festival to play nicely with Python: 

1. Download the festival source files from
   [here](http://www.cstr.ed.ac.uk/downloads/festival/2.1/). You'll need at the
   very least the festival-2.1 release bundle and the speech tools bundle.
2. Extract the speech tools package and apply the patch provided in this
   repository to the top level directory.

<pre><code>$ tar xfvz speech_tools-2.1-release.tar.gz
     $ patch -Np0 -i pyfestival/libestools.patch
     $ cd speech-tools
     $ ./configure && make && sudo make install
</code></pre>

3. Extract and build festival itself

<pre><code> $ tar xfvz festival-2.1-release.tar.gz
     $ cd festival
     $ ./configure && make && sudo make install
</code></pre>

4. You should now be able to build and install pyfestival

## Building and Installing PyFestival

Pyfestival uses [setuptools](https://pypi.python.org/pypi/setuptools) to build
and install the package. Provided you have the necessary dependencies set up
already. Run the following from your pyfestival source directory

    $ python setup.py build
    $ sudo python setup.py install

You should now be able to use the module.

## Basic Usage.

PyFestival is basically a wrapper around the [Festival C++
API](http://www.cstr.ed.ac.uk/projects/festival/manual/festival_28.html#SEC133).
The following functions have been mapped/wrapped:

 * festival_initialize(int,int) -> festival.initialize(int,int)
 * festival_say_text(const EST_String &text) -> festival.say(str)
 * festival_say_file(const EST_String &filename) -> festival.say_file(str)
 * festival_load_file(const EST_String &filename) -> festival.load_file(str)
 * festival_eval_command(const EST_String &expr) -> festival.eval(str)

Unfortunately, festival_text_to_wave has not yet been mapped/wrapped.

A standard usage of the library might look like the following:

    $  python                                                               
    Python 2.7.4 (default, Apr  6 2013, 19:20:36) 
    [GCC 4.8.0] on linux2
    Type "help", "copyright", "credits" or "license" for more information.
    >>> import festival
    >>> festival.initialize(1, 210000)
    >>> festival.say("Hello World")
    1
    >>> 

The arguments to initialize are the ones suggested by the [API](http://www.cstr.ed.ac.uk/projects/festival/manual/festival_28.html#SEC133).

**Note: You must run festival.initialize() before you do any other operations,
festival will segfault if you don't**
