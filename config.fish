fish_vi_key_bindings
set -l GRUVBOX_SCRIPT ~/.vim/plugged/gruvbox/gruvbox_256palette.sh
if test -f $GRUVBOX_SCRIPT
  bash $GRUVBOX_SCRIPT
end

if which mvim > /dev/null
    function vi; mvim -v $argv; end
    function vim; vi $argv; end
end

if test -f /opt/dev/dev.fish
  source /opt/dev/dev.fish
end
