# Vim support for Private Comments

[Private Comments](https://github.com/masukomi/private_comments/) allows you to record comments _in_ your code that aren't _in_ the codebase. 

This plugin allows you to integrate Vim with Private Comments.

## Requirements

* the Private Comments server must be running locally
* the `pc` client must be in your `$PATH`[^1]

## Installation

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



* `:pcl` -> (l for View) Views the private comments for the current file.
* `:pcr` -> (r for Record) Records a private comment for the current line of the current file.
* `:pcd` -> (d for Delete) Deletes the private comment on the current line.
* `:pcj` -> (j for Jump) Run from within the private comments listing this will Jump you to the comment about the specified line.
* `:pcc` -> (c for Close) closes the private comments window.


----

^1: Note: [This article](https://medium.com/@jalendport/what-exactly-is-your-shell-path-2f076f02deb4) describes [PATH] and how to work with it if you're unfamiliar.
