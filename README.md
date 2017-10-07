# Overview

This provides vim syntax highlighting for the [Madlibs](http://github.com/vmchale/madlibs)
randomized templating language.

## Installation

Using Vundle:

```
Plugin `vmchale/madlang-vim`
```

## Configuration

If you want, you can add the following to your .vimrc:

```
autocmd BufWritePost *.mad MadlangCheck
```

This will automatically check syntax of madlang files every time you write the
buffer. You can also set `g:syntastic_madlang_checkers` manually if you do not
want the default linter to run.

## Screenshots

The highlighting should look like the following:

![Syntax highlighting screenshot](https://raw.githubusercontent.com/vmchale/madlang-vim/master/vim-screenshot.png "Syntax highlighting screenshot")
