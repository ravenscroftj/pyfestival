/**
* This is a SWIG wrapper for the festival C/C++ api
*
*
*/
%module festival

%{
#define SWIG_FILE_WITH_INIT
//#include "pyfestival.h"
#include "festival.h"
%}

%typemap(in)  const EST_String &{
     $1 = new EST_String(PyString_AsString($input)) ;
}

%rename(initialize) festival_initialize;
void festival_initialize(int load_init_files,int heapsize);

%rename(say) festival_say_text;
int festival_say_text(const EST_String &text);

%rename(say_file) festival_say_file;
//say the contents of filename
int festival_say_file(const EST_String &filename);

%rename(load_file) festival_load_file;
//load and evaluate LISP commands
int festival_load_file(const EST_String &filename);

%rename(eval) festival_eval_command;
//evaluate a command given as an expression
int festival_eval_command(const EST_String &expr);

//%rename(text_to_wave) festival_text_to_wave;
//turn given text into a wave file
//int festival_text_to_wave(const EST_String &text,EST_Wave &wave);
