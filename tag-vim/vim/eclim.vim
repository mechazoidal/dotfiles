" Eclim settings
" FIXME should only trigger if eclim is installed
" http://writequit.org/blog/?p=279
" ,ji imports whatever is needed for current line
nnoremap <silent> <leader>ji :JavaImport<cr>
" ,jd opens javadoc for statement in browser
nnoremap <silent> <leader>jd :JavaDocSearch -x declarations<cr>
" ,<enter> searches context for statement
"nnoremap <silent> <leader><cr> :JavaSearchContext<cr>
" ,jv validates current java file
"nnoremap <silent> <leader>jv :Validate<cr>
" ,jc shows corrections for the current line of java
"nnoremap <silent> <leader>jc :JavaCorrect<cr>

if exists("g:EclimBrowser") && has("gui_macvim")
  "'open' on OSX will open the url in the default browser without issue
  let g:EclimBrowser='open'
  "don't put TODO/FIXME in task list 
  "http://stackoverflow.com/questions/18618985/how-do-i-make-todos-not-show-up-as-errors-in-eclim
  let g:EclimSignLevel=2
end

" let eclim and other completers play nice together
if exists("g:EclimCompletionMethod") && has("gui_macvim")
  let g:EclimCompletionMethod = 'omnifunc'
end
