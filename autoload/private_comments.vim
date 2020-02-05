function! private_comments#Load()
	"let repo_root = system('git rev-parse --show-toplevel')
	" echo 'Repo Root is at: ' . repo_root
	let t:pc_parent_win = winnr()
	let l:file_path = @%
	" echo 'File path is: ' . file_path
	let comments = system('pc -f ' . l:file_path)
	" let comments = system('ls ') " . file_path)
	if v:shell_error == 0
		let file_path_hash = system('shasum -a 256 ' . fnameescape(file_path))
		" split new buffer
		set splitbelow
		6new
		" TODO: record the winnr() of this new window
		"       and? the buffnr of the new buffer
		"       so that we can refresh instead of
		"       creating another one.
		call setline(1, "Private Comments:")
		call setline(2, split(comments, "\n\n"))
		setlocal buftype=nofile
		setlocal noswapfile
		setlocal nomodifiable
		wincmd p

	else
		echoerr 'Problem communicating with private comments: ' . comments
	endif
	1
endfunction


function! private_comments#JumpToCommentLine()
	" line('.') -> line number
	" getline('.') -> line text
	let l:line_number = substitute(getline('.'), "^\\(\\d\\+\\):.*", "\\1", "")
	let l:line_number = l:line_number+0 " convert to number
	echo l:line_number
	if l:line_number > 0
		" let l:file_path = @%
		execute t:pc_parent_win . 'wincmd w'
		" echo "jumping to line " . l:line_number
		call cursor(l:line_number, 0)
	endif
endfunction

