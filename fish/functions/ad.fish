function ad --wraps='github add' --wraps='gith add' --wraps='git add' --wraps='git add .' --description 'alias ad=git add .'
  git add . $argv; 
end
