" Python

let g:lsp_settings = {}
let g:lsp_settings['pylsp'] =
    \ {
    \   'workspace_config': {'pylsp': {
    \     'configurationSources': ['flake8'],
    \     'plugins': {
    \	    'flake8': {'enabled': v:true},
    \	    'mypy-ls': {'enabled': v:true, 'live_mode': v:false},
    \	    'pylint': {'enabled': v:true},
    \	    'pydocstyle': {'enabled': v:true},
    \	    'pyls_isort': {'enabled': v:true},
    \	    'black': {'enabled': v:true},
    \     }
    \   }}
    \ }
