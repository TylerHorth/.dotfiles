fish_vi_key_bindings

set fish_term24bit 1

set -l GRUVBOX_SCRIPT ~/.vim/plugged/gruvbox/gruvbox_256palette.sh
if test -f $GRUVBOX_SCRIPT
  bash $GRUVBOX_SCRIPT
end

if which mvim > /dev/null
  function vi; mvim -v $argv; end
  function vim; mvim -v $argv; end
end

if which nvim > /dev/null
  function vi; nvim $argv; end
  function vim; nvim $argv; end
end

if test -f /opt/dev/dev.fish
  source /opt/dev/dev.fish
end

function fish_prompt
  env FISH_VERSION=$FISH_VERSION PROMPTLINE_LAST_EXIT_CODE=$status bash ~/.config/fish/promptline left
end

function fish_mode_prompt --description 'Displays the current mode'
  if test "$fish_key_bindings" = "fish_vi_key_bindings"
    switch $fish_bind_mode
      case default
        set_color --bold --background a89984 282828
        echo ' N '
        if test -n $SSH_CLIENT
          set_color --bold --background a89984 504945
        else
          set_color --bold --background 504945 a89984
        end
        echo ''
      case insert
        set_color --bold --background 83a598 282828
        echo ' I '
        if test -n $SSH_CLIENT
          set_color --bold --background a89984 83a598
        else
          set_color --bold --background 504945 83a598
        end
        echo ''
      case replace-one
        set_color --bold --background 8ec07c 282828
        echo ' R '
        if test -n $SSH_CLIENT
          set_color --bold --background a89984 8ec07c
        else
          set_color --bold --background 504945 8ec07c
        end
        echo ''
      case visual
        set_color --bold --background d79921 282828
        echo ' V '
        if test -n $SSH_CLIENT
          set_color --bold --background a89984 d79921
        else
          set_color --bold --background 504945 d79921
        end
        echo ''
    end
    set_color normal
  end
end

bind L 'nextd; commandline -f repaint'
bind H 'prevd; commandline -f repaint'
