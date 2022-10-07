find ~/quicklisp/local-projects -name '*.fmt' -exec fgrep -H '(.' '{}' ';' 2>/dev/null | fgrep -v node_modules | fgrep -v '...' | fgrep -v 'min.js' 2>/dev/null | grep -v 'obsidian'
find ~/quicklisp/local-projects -name '*.js' -exec fgrep -H '(.' '{}' ';' 2>/dev/null | fgrep -v node_modules | fgrep -v '...' | fgrep -v 'min.js' 2>/dev/null | grep -v 'obsidian'
echo
echo '*** (.def'
find ~/quicklisp/local-projects -name '*' -exec fgrep -H '(.def' '{}' ';' 2>/dev/null | fgrep -v node_modules | fgrep -v '...' | fgrep -v 'min.js' 2>/dev/null | grep -v 'obsidian'
