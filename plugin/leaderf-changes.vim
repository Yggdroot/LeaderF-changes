" ============================================================================
" File:        leaderf-changes.vim
" Description:
" Author:      Yggdroot <archofortune@gmail.com>
" Website:     https://github.com/Yggdroot
" Note:
" License:     Apache License, Version 2.0
" ============================================================================

if !exists("g:Lf_Extensions")
    let g:Lf_Extensions = {}
endif

let g:Lf_Extensions.changes = {
            \ "source": "leaderf#changes#source",
            \ "accept": "leaderf#changes#accept",
            \ "preview": "leaderf#changes#preview",
            \ "bang_enter": "leaderf#changes#bang_enter",
            \ "highlights_def": {
            \         "Lf_hl_ChangesTitle": '^[^> \t].*',
            \         "Lf_hl_ChangesText": '.\{-}\d\+\s\+\d\+\s\+\d\+\s\+\zs.*',
            \ },
            \ "highlights_cmd": [
            \         "hi link Lf_hl_ChangesTitle Title",
            \         "hi link Lf_hl_ChangesText Directory",
            \ ],
            \ }

command! -bar -nargs=0 LeaderfChanges Leaderf changes 
let g:Lf_SelfContent['LeaderfChanges'] = "vim change list"
