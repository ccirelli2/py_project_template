colorscheme elflord                                                             
set colorcolumn=80                                                              
set number                                                                      
set tabstop=4                                                                   
set shiftwidth=4                                                                
hi ColorColumn ctermbg=lightcyan guibg=blue                                     
syntax enable                                                                   
set number                                                                      
set expandtab                                                                   
set hlsearch                                                                    
let python_highlight_all = 1                                                    
                                                                                
set guicursor=n-v-c:block-Cursor                                                
set guicursor+=i:ver25-iCursor                                                  
                                                                                
" Sent all vim temp files to /tmp folder"                                       
set backupdir=.backup/,~/.backup/,/tmp//                                        
set directory=.swp/,~/.swp/,/tmp//                                              
set undodir=.undo/,~/.undo/,/tmp//  

" Remap Shortcuts "                                                             
inoremap <C-b> <C-p>                                                            
                                                                                
" Syntastic Linting "                                                           
execute pathogen#infect()                                                       
set statusline+=%#warningmsg#                                                   
set statusline+=%{SyntasticStatuslineFlag()}                                    
set statusline+=%*                                                              
                                                                                
let g:syntastic_always_populate_loc_list = 1                                    
let g:syntastic_auto_loc_list = 1                                               
let g:syntastic_check_on_open = 1                                               
let g:syntastic_check_on_wq = 0                                                 
let g:syntastic_loc_list_height = 3                                             
" Tell pyflakes to use python3 pyflakes module to fix issue with type hinting errors"
let g:syntastic_python_pyflakes_exe = 'python3 -m pyflakes'                     
                                                                                
let g:syntastic_python_checkers = ['pylint', 'flake8', 'pep8', 'pycodestyle', 'pyflakes', 'python']
let g:syntastic_quiet_messages = {"regex": ["wrong-import-position",            
    \"too-many-arguments",                                                      
    \"trailing-whitespace",                                                     
    \"logging-fstring-interpolation",                                           
    \"too-many-function-args",                                                  
    \"W291",                                                                    
    \"E402",                                                                    
    \"unable to import",                                                        
    \"unused-import",                                                           
    \"Using the global statement",                                              
    \"abstract-class-instantiated",                                             
    \"unexpected-keyword-arg",                                                  
    \"line too long",                                                           
    \"too general exception",                                                   
    \"too-many-instance-attributes",                                            
    \"too-many-locals"]}    
