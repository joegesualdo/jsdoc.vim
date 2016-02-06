## JSDoc Vim
> Generate [JSDoc](http://usejsdoc.org/) block comments in vim.

## Demo

![jsdoc vim gif](https://raw.github.com/joegesualdo/jsdoc.vim/master/jsdoc-vim-demo.gif)

## Install

### Vundle
> [Vundle](https://github.com/VundleVim/Vundle.vim) is the recommended installation method

Add to your plugin list:

```
Plugin 'mxw/vim-jsx'
```

Once added you your plugin list, you must install the plugin.

Launch vim and run:

```
:BundleInstall
```

Or install from command line:

```
$ vim +PluginInstall +qall
```

## Usage

You can execute the JSDocAdd() function directly within a buffer. But it's
recommended you add a mapping.

### How to call function directly.
Call the function while cursor is on first line of a function definition:

```
:call JSDocAdd()
```

### How to call from mapping

Define the mapping in your `.vimrc`.

```
nnoremap jsd :<C-u>call JSDocAdd()<CR>
```

Now while cursor is on first line of a function definition, you can call
the mapping.
