![lade][lade_banner]


>**lade** _/leɪd/_ vb (lad·es, lad·ing, lad·ed, lad·en /ˈleɪdən/, lad·ed) <br>
>&emsp;&emsp; to load with or as if with cargo.

## Overview

lade is a cross-platform [DLL injection] utility. Conveniently used over the command line, it allows libraries to be injected into third-party processes. This is primarily useful for cheating and for behaviour modification of closed source applications in general.

lade is written in C99 and supports both IA32 and AMD64 versions of Windows, <s>Linux</s> and macOS.

[![Build Status](https://travis-ci.org/a3f/lade.svg?branch=master)](https://travis-ci.org/a3f/lade) [![Build status](https://ci.appveyor.com/api/projects/status/kx3yqmdxent7t3e0/branch/master?svg=true)](https://ci.appveyor.com/project/a3f/lade/branch/master)

## Build Instructions

    $ git clone https://github.com/a3f/lade
    $ mkdir lade/build
    $ cd lade/build
    $ cmake ..
    $ make install
	
Builds and installs the commad-line lade utility as well as liblade.

## Example usage
    
    # Load a DLL and run its constructor (or DllMain)
    $ lade -a `pkg-config --libs libhellow`
    # Inject shell with library
    $ lade -p$$ ./libstuff.so
    # Inject process by window class name
    $ lade -c tibiaclient ./coolbot.dll

## License

liblade is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License v3.0.

The command-line [lade utility] is licensed under the MIT license.

## TODO

- [x] macOS support
- [ ] Allow multiple injections on macOS
- [x] Refactor the Win32 code and upload it
- [ ] Figure out how to do same with Linux
- [x] More advanced process identification

[DLL injection]: https://en.wikipedia.org/wiki/DLL_injection
[lade_banner]: https://raw.githubusercontent.com/a3f/lade/master/ext/img/banner_by_reddit.com_u_Gin_chan.png
[lade utility]: https://github.com/a3f/lade/blob/master/cli.c
