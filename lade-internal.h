#ifndef LADE_INTERNAL_H_
#define LADE_INTERNAL_H_

#ifdef __GNUC__ 
#define likely(cond)       __builtin_expect((cond), 1)
#define unlikely(cond)     __builtin_expect((cond), 0)
#else
#define likely(cond) cond
#endif

#ifdef __GNUC__
#pragma GCC diagnostic ignored "-Wmissing-field-initializers"
#pragma GCC diagnostic ignored "-Wmissing-braces"
#endif

#include <stdio.h>

#define require(cond, label)        \
    do {                            \
         if (unlikely(!(cond)))   { \
             goto label;            \
             printf("failed at %s:%d\n", __FILE__, __LINE__); \
         }                          \
    } while (0)

#endif
