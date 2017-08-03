function fish_user_key_bindings
  fish_vi_key_bindings
  source ~/.fzf/shell/key-bindings.fish
  fzf_key_bindings
  bind -M insert \cf accept-autosuggestion
  bind \cf accept-autosuggestion
end

set fish_term24bit 1

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
        if test -n "$SSH_CLIENT"
          set_color --bold --background a89984 504945
          echo ''
        else
          set_color --bold --background 504945 a89984
          echo ''
        end
      case insert
        set_color --bold --background 83a598 282828
        echo ' I '
        if test -n "$SSH_CLIENT"
          set_color --bold --background a89984 83a598
        else
          set_color --bold --background 504945 83a598
        end
        echo ''
      case replace-one
        set_color --bold --background 8ec07c 282828
        echo ' R '
        if test -n "$SSH_CLIENT"
          set_color --bold --background a89984 8ec07c
        else
          set_color --bold --background 504945 8ec07c
        end
        echo ''
      case visual
        set_color --bold --background d79921 282828
        echo ' V '
        if test -n "$SSH_CLIENT"
          set_color --bold --background a89984 d79921
        else
          set_color --bold --background 504945 d79921
        end
        echo ''
    end
    set_color normal
  end
end

function ssh_agent --description 'launch the ssh-agent and add the id_rsa identity'
    if begin
            set -q SSH_AGENT_PID
            and kill -0 $SSH_AGENT_PID
            and grep -q '^ssh-agent' /proc/$SSH_AGENT_PID/cmdline
    end
        echo "ssh-agent running on pid $SSH_AGENT_PID"
    else
        eval (command ssh-agent -c | sed 's/^setenv/set -Ux/')
    end
    set -l identity $HOME/.ssh/id_rsa
    set -l fingerprint (ssh-keygen -lf $identity | awk '{print $2}')
    ssh-add -l | grep -q $fingerprint
        or ssh-add $identity
end

bind L 'nextd; commandline -f repaint'
bind H 'prevd; commandline -f repaint'

set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --glob "!.git/*"'
