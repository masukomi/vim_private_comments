function! private_comments#Load()
	"let repo_root = system('git rev-parse --show-toplevel')
	" echo 'Repo Root is at: ' . repo_root
	let file_path = @%
	" echo 'File path is: ' . file_path
	let comments = system('pc -f ' . file_path)
	" let comments = system('ls ') " . file_path)
	" if v:shell_error == 0
		let file_path_hash = system('shasum -a 256 ' . fnameescape(file_path))
		" split new buffer
		set splitbelow
		6new
		" TODO: record the winnr() of this new window
		"       and? the buffnr of the new buffer
		"       so that we can refresh instead of
		"       creating another one.
		call setline(1, "Private Comments:")
		call setline(2, split(comments, "\n"))
		setlocal buftype=nofile
		setlocal noswapfile
		setlocal nomodifiable
		wincmd p

	" else
	" 	echoerr 'Problem communicating with private comments: ' . comments
	" endif
	1
endfunction

