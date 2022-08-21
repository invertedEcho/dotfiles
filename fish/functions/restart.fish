function restart --wraps='sudo s6-svc -r' --description 'alias restart=sudo s6-svc -r'
  sudo s6-svc -r $argv; 
end
