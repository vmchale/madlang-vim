# Overview

This provides vim syntax highlighting for the [Madlang](https://hub.darcs.net/vmchale/madlang)
text generation language.

## Installation

Using [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'vmchale/madlang-vim'
```

You can also install with the `madlang` executable:

```bash
 $ madlang vim
```

## Configuration

If you want, you can add the following to your .vimrc:

```
autocmd BufWritePost *.mad MadlangCheck
```

This will automatically check syntax of madlang files every time you write the
buffer. You can also set `g:syntastic_madlang_checkers` manually if you do not
want the default linter to run.

## Help

If you get stuck, typing

```
:h madlang
```

will bring up the help for this plugin.

## Screenshots

The highlighting should look like the following:

![Syntax highlighting screenshot](https://raw.githubusercontent.com/vmchale/madlang-vim/master/vim-screenshot.png "Syntax highlighting screenshot")
