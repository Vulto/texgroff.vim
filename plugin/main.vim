let mapleader="\\"

" TODO: If zathura open, refresh
function! Preview()
		:call Compile()<CR><CR>
		execute "! clear ; ! killall zathura &>/dev/null ; ! zathura /tmp/op.pdf &"
endfunction

function! Compile()
		let extension = expand('%:e')
		if extension == "ms"
				execute "! groff -ms % -T pdf > /tmp/op.pdf"
		elseif extension == "tex"
				execute "! pandoc -f latex -t latex % -o /tmp/op.pdf"
		elseif extension == "md"
				execute "! pandoc % -s -o /tmp/op.pdf"
		endif
endfunction


noremap <leader>p :call Preview()<CR><CR><CR>
noremap <leader>q :call Compile()<CR><CR>
