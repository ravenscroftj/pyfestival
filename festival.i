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

//void pyfest_init();

void festival_initialize(int load_init_files,int heapsize);

//int pyfest_say_text(const char* text);

//say the contents of filename
//int festival_say_file(const EST_String &filename);

//load and evaluate LISP commands
//int festival_load_file(const EST_String &filename);

//evaluate a command given as an expression
//int festival_eval_command(const EST_String &expr);

//turn given text into a wave file
//int festival_text_to_wave(const EST_String &text,EST_Wave &wave);
