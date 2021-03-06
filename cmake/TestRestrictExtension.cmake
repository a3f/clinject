# This code was adapted from http://www.gromacs.org/
# and its toplevel COPYING file starts with:
#
# GROMACS is free software, distributed under the GNU General Public License
# (GPL) Version 2.

# - Define macro to check restrict keyword
#
#  GMX_TEST_RESTRICT(VARIABLE)
#
#  VARIABLE will be set to the keyword
#
#  Remember to have a cmakedefine for it too...

MACRO(GMX_TEST_RESTRICT VARIABLE)
    IF(NOT DEFINED TEST_${VARIABLE})

        MESSAGE(STATUS "Checking for restrict keyword")

        # We start with restrict, because that's the default. _Restrict is SunCC-specific
        FOREACH(KEYWORD "restrict" "__restrict" "__restrict__" "_Restrict")
            IF(NOT TEST_${VARIABLE})
                TRY_COMPILE(TEST_${VARIABLE} "${CMAKE_BINARY_DIR}"
                    "${CMAKE_SOURCE_DIR}/cmake/TestRestrict.c"
                    COMPILE_DEFINITIONS "-DTESTRESTRICTDEF=${KEYWORD}" )
                SET(LAST_RESTRICT_KEYWORD ${KEYWORD})
            ENDIF(NOT TEST_${VARIABLE})
        ENDFOREACH(KEYWORD)

        IF(TEST_${VARIABLE})
            SET(${VARIABLE} ${LAST_RESTRICT_KEYWORD} CACHE INTERNAL "Restrict keyword" FORCE)
            MESSAGE(STATUS "Checking for restrict keyword - ${LAST_RESTRICT_KEYWORD}")
        ELSE(TEST_${VARIABLE})
            SET(${VARIABLE} " " CACHE INTERNAL "Restrict keyword" FORCE)
            MESSAGE(STATUS "Checking for restrict keyword - not found")
        ENDIF(TEST_${VARIABLE})

    ENDIF(NOT DEFINED TEST_${VARIABLE})
ENDMACRO(GMX_TEST_RESTRICT VARIABLE)
