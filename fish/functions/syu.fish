function syu --wraps='yay -Syu' --description 'alias syu=yay -Syu'
  paru -Syu $argv; 
end
