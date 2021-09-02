# Copy Project

[![N|Solid](https://cldup.com/dTxpPi9lDf.thumb.png)](https://nodesource.com/products/nsolid)

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)


This repository was created as a example to explain C and some GCC concepts


## Clone Project

```bash
$ git clone https://github.com/MichaelBittencourt/copy_file.git
$ cd copy_file
```

## Running

```bash
$ make
$ ./copy file1 file2
```

## See System Call in Stack Trace

With command `strace` on Ubuntu 20.04, you can check the stack trace of a program execution and check all system call used.

```bash
$ strace ./copy file1 file2
```

## Create debug binary

```bash
$ make debug
```

## Cleaning

```bash
$ make clean
```

## Create verbose binary

```bash
$ make DEFINES=-DVERBOSE
```

## Create pre-processed C files

```bash
$ make pre_processor
```

## Create assembly files

This option create a folder with assembly files

```bash
$ make assembly
```

## Create pre-processed C files

This option create a folder with pre-processed files

```bash
$ make pre_processor
```

## Show Help make menu

```bash
$ make help
```

## [OBS]

- You can combine the build options `make pre_processor assembly debug`
- Please, try test combinations and check target files
- Check source files
- Ask any question about the exercise

# Next Exercises

- [Check the first Makefile Exercise](https://github.com/MichaelBittencourt/MakefileExamples)
- [Try implement option -r to copy a folder recursively in this project](https://stackoverflow.com/questions/12489/how-do-you-get-a-directory-listing-in-c)
- [Create a simple program that use fork function to create another process](https://www.geeksforgeeks.org/fork-system-call/).
- [Try the method execv and its variations](https://www.qnx.com/developers/docs/6.5.0SP1.update/com.qnx.doc.neutrino_lib_ref/e/execv.html).
