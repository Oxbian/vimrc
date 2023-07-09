" Python

let g:lsp_settings = {}
let g:lsp_settings['pylsp-all'] =
    \ {
    \   'workspace_config': {'pylsp-all': {
    \     'configurationSources': ['flake8'],
    \     'plugins': {
    \	    'pyflakes' : {'enabled': v:false},
    \	    'flake8': {'enabled': v:true},
    \	    'mypy-ls': {'enabled': v:true, 'live_mode': v:false},
    \	    'pylint': {'enabled': v:true},
    \	    'pydocstyle': {'enabled': v:true},
    \	    'pyls_isort': {'enabled': v:true},
    \	    'autopep8': {'enabled': v:false},
    \	    'yapf': {'enabled': v:false},
    \	    'black': {'enabled': v:true},
    \     }
    \   }}
    \ }
