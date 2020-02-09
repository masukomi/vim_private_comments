" Requires private_comments server to be running
" and pc client app to be in your PATH
" see https://private-comments.com for details
" See README.md for usage.

function! private_comments#View()
	"let repo_root = system('git rev-parse --show-toplevel')
	" echo 'Repo Root is at: ' . repo_root
	let t:pc_parent_win = winnr()
	let l:file_path = @%
	" echo 'File path is: ' . file_path
	let comments = system('pc -f ' . l:file_path )
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
		"let t:pc_comments_win = ???
		call setline(1, "Private Comments:")
		call setline(2, split(comments, "\n\n"))
		setlocal buftype=nofile
		setlocal noswapfile
		setlocal nomodifiable
		setlocal nonumber
		let t:pc_comments_win = winnr()
		wincmd p
	else
		echoerr 'Problem communicating with private comments. Is the server running? ' . comments

	endif
	1
endfunction
" :cabbr pcv :call private_comments#View()



function! private_comments#JumpToCommentLine()
	" line('.') -> line number
	" getline('.') -> line text
	let l:line_number = substitute(getline('.'), "^\\(\\d\\+\\):.*", "\\1", "")
	let l:line_number = l:line_number+0 " convert to number
	echo l:line_number
	if l:line_number > 0
		" let l:file_path = @%
		execute t:pc_parent_win . 'wincmd w'
		echo "jumping to line " . l:line_number
		call cursor(l:line_number, 0)
	endif
endfunction
" :cabbr pcj :call private_comments#JumpToCommentLine()

function! private_comments#RecordComment()
	" get the line we are commenting on
	let l:line_number = line('.')
	" get the file we are commenting on
	let l:file_path = @%

	call inputsave()
	let l:comment = inputdialog('Enter comment for line ' . l:line_number . ': ')
	call inputrestore()
	" TODO: figure out how to clear command line of what you input

	" submit it
	let l:command = 'pc -f '  . l:file_path . ' -l ' . l:line_number . ' -c "' . substitute(l:comment, '"', '\\"', "g") . '" 2> /dev/null'
	call system(l:command)
	if v:shell_error == 0
		echo "comment saved"
	elseif v:shell_error == 9
		echoerr 'Problem. Either that line is uncommitted, or the server is down.'
	else
		echoerr 'Problem communicating with private comments. Is the server running?'
	endif
	" TODO: test if t:pc_comments_win still exists
	" close it if it does
	call private_comments#ClosePCWindow()

	call private_comments#View()
endfunction
" :cabbr pcr :call private_comments#RecordComment()

function! private_comments#DeleteComment()
	" get the line we are commenting on
	let l:line_number = line('.')
	" get the file we are commenting on
	let l:file_path = @%
	call system("pc -f " . l:file_path . ' -l ' . l:line_number . ' -d 2>/dev/null')
	if v:shell_error == 0
		echo "comment deleted"
	elseif v:shell_error == 9
		echoerr 'Problem. Either that line is uncommitted, or the server is down.'
	else
	else
		echoerr 'Problem communicating with private comments. Is the server running?'
	endif
	call private_comments#ClosePCWindow()
	call private_comments#View()
	echo ''

endfunction
" :cabbr pcd :call private_comments#DeleteComment()

"--------------------
" internal use only
function! private_comments#ClosePCWindow()
	if exists("t:pc_comments_win")
		execute t:pc_comments_win . 'close'
		unlet t:pc_comments_win
	endif
endfunction
" :cabbr pcc :call private_comments#ClosePCWindow()

