function com --wraps='git add' --wraps='git commit -m' --description 'alias com=git commit -m'
  git commit -m $argv; 
end
