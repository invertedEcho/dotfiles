function updatekernel --wraps='cd /usr/src/linux && make -j16 && make modules_install && make install && grub-mkconfig -o /boot/grub/grub.cfg' --wraps='cd /usr/src/linux && sudo make -j16 && sudo make modules_install && sudo make install && sudo grub-mkconfig -o /boot/grub/grub.cfg' --description 'alias updatekernel=cd /usr/src/linux && sudo make -j16 && sudo make modules_install && sudo make install && sudo grub-mkconfig -o /boot/grub/grub.cfg'
  cd /usr/src/linux && sudo make -j16 && sudo make modules_install && sudo make install && sudo grub-mkconfig -o /boot/grub/grub.cfg $argv; 
end
