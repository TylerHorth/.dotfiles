fish_vi_key_bindings
set -l GRUVBOX_SCRIPT ~/.vim/plugged/gruvbox/gruvbox_256palette.sh
if test -f $GRUVBOX_SCRIPT
  bash $GRUVBOX_SCRIPT
end

if which mvim > /dev/null
  function vi; mvim -v $argv; end
  function vim; mvim -v $argv; end
end

if test -f /opt/dev/dev.fish
  source /opt/dev/dev.fish
end

function fish_prompt
  env FISH_VERSION=$FISH_VERSION PROMPTLINE_LAST_EXIT_CODE=$status bash promptline.sh left
end

function fish_mode_prompt --description 'Displays the current mode'
  if test "$fish_key_bindings" = "fish_vi_key_bindings"
    switch $fish_bind_mode
      case default
        set_color --bold --background a89984 282828
        echo ' NORMAL '
        set_color --bold --background 504945 a89984
      case insert
        set_color --bold --background 83a598 282828
        echo ' INSERT '
        set_color --bold --background 504945 83a598
      case replace-one
        set_color --bold --background 8ec07c 282828
        echo ' REPLACE'
        set_color --bold --background 504945 8ec07c
      case visual
        set_color --bold --background d79921 282828
        echo ' VISUAL '
        set_color --bold --background 504945 d79921
    end
    echo ''
    set_color normal
  end
end

bind L 'nextd; commandline -f repaint'
bind H 'prevd; commandline -f repaint'
