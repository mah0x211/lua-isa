rockspec_format = '3.0'
package = 'isa'
version = 'scm-1'
source = {
    url = 'git+https://github.com/mah0x211/lua-isa.git'
}
description = {
    summary = 'type checking utility module',
    homepage = 'https://github.com/mah0x211/lua-isa',
    license = 'MIT/X11',
    maintainer = 'Masatoshi Fukunaga'
}
dependencies = {
    'lua >= 5.1',
}
build = {
    type = 'builtin',
    modules = {
        isa = 'isa.lua',
        ['isa.isfile'] = {
            sources = { 'src/isfile.c' },
            incdirs = { 'deps/lauxhlib' },
        },
    }
}

