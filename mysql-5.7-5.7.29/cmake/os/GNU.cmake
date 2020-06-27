# This file includes GNU/Hurd specific options and quirks, related to system checks

INCLUDE(CheckSymbolExists)

SET(_GNU_SOURCE 1)

# Fix CMake (< 2.8) flags. -rdynamic exports too many symbols.
FOREACH(LANG C CXX)
  STRING(REPLACE "-rdynamic" ""
  CMAKE_SHARED_LIBRARY_LINK_${LANG}_FLAGS
  "${CMAKE_SHARED_LIBRARY_LINK_${LANG}_FLAGS}"
  )
ENDFOREACH()

# Ensure we have clean build for shared libraries
# without unresolved symbols
SET(LINK_FLAG_NO_UNDEFINED "-Wl,--no-undefined")

# 64 bit file offset support flag
SET(_FILE_OFFSET_BITS 64)
