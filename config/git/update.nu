# git editor
git config --global core.editor hx

# delta tool
git config --global core.pager delta
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.navigate true
git config --global delta.side-by-side true
git config --global merge.conflictstyle diff3
git config --global diff.colorMoved default

# difftastic tool
git config --global diff.tool difftastic
git config --global difftool.prompt false
git config --global difftool.difftastic.cmd 'difft "$LOCAL" "$REMOTE"'
git config --global pager.difftool true

# aliases
git config --global alias.st status
git config --global alias.sw switch
git config --global alias.dft difftool
git config --global alias.dlog "!f() { GIT_EXTERNAL_DIFF=difft git log -p --ext-diff $@; }; f"
