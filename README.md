# Vim support for Private Comments

[Private Comments](https://github.com/masukomi/private_comments/) allows you to record comments _in_ your code that aren't _in_ the codebase. 

This plugin allows you to integrate Vim with Private Comments.

## Requirements

* The Private Comments server must be running locally
* The `pc` client must be in your `$PATH`[^1]
* The [git](https://git-scm.com/) command line client must be installed and also in your `$PATH`

## Installation

This plugin follows the standard runtime path structure, and as such it can be installed with a variety of plugin managers:

| Plugin Manager | Install with... |
| ------------- | ------------- |
| [Pathogen][1] | `git clone https://github.com/masukomi/vim_private_comments ~/.vim/bundle/vim-airline`<br/>Remember to run `:Helptags` to generate help tags |
| [NeoBundle][2] | `NeoBundle 'masukomi/vim_private_comments'` |
| [Vundle][3] | `Plugin 'masukomi/vim_private_comments'` |
| [Plug][4] | `Plug 'masukomi/vim_private_comments'` |
| [VAM][5] | `call vam#ActivateAddons([ 'vim-airline' ])` |
| [Dein][6] | `call dein#add('masukomi/vim_private_comments')` |
| [minpac][7] | `call minpac#add('masukomi/vim_private_comments')` |
| pack feature (native Vim 8 package feature)| `git clone https://github.com/masukomi/vim_private_comments ~/.vim/pack/dist/start/vim-airline`<br/>Remember to run `:helptags` to generate help tags |
| manual | copy all of the files into your `~/.vim` directory |



Vim Plug: `Plug 'masukomi/vim_private_comments'`  

Alternately, however your preferred plugin manager generally installs vim plugins on GitHub.

## Usage
Add the following aliases to your `~/.vimrc` to create aliases for each of the four Private Comments commands. Then reload your ~/.vimrc or restart vim. 

```vim
:cabbr pcv :call private_comments#View()
:cabbr pcj :call private_comments#JumpToCommentLine()
:cabbr pcr :call private_comments#RecordComment()
:cabbr pcd :call private_comments#DeleteComment()
:cabbr pcc :call private_comments#ClosePCWindow()
```


### Mnemonics

* `:pcv` -> (v for View) Views the private comments for the current file.
* `:pcr` -> (r for Record) Records a private comment for the current line of the current file.
* `:pcd` -> (d for Delete) Deletes the private comment on the current line.
* `:pcj` -> (j for Jump) Run from within the private comments listing this will Jump you to the comment about the specified line.
* `:pcc` -> (c for Close) closes the private comments window.

## License
[MIT][8]

----

^1: Note: [This article](https://medium.com/@jalendport/what-exactly-is-your-shell-path-2f076f02deb4) describes [PATH] and how to work with it if you're unfamiliar.


[1]: https://github.com/tpope/vim-pathogen
[2]: https://github.com/Shougo/neobundle.vim
[3]: https://github.com/VundleVim/Vundle.vim
[4]: https://github.com/junegunn/vim-plug
[5]: https://github.com/MarcWeber/vim-addon-manager
[6]: https://github.com/Shougo/dein.vim
[7]: https://github.com/k-takata/minpac/
[8]: https://github.com/masukomi/vim_private_comments/blob/master/LICENSE.md

