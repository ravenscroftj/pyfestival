/**
 * This is where the actual cool stuff goes 
 *
 *
 */

#include "pyfestival.h"

/**
 *  Start festival stuff
 *
 */
void pyfest_init(){
    int heap_size = 210000;  // default scheme heap size
    int load_init_files = 1; // we want the festival init files loaded

    festival_initialize(load_init_files,heap_size);
}

int pyfest_say_text(const char* text) {
    //say some text
    return festival_say_text(text);
}
