#!/usr/bin/bash

# depends on "lnif" function (which depends on explicit $HOME paths); 
# see separate bash repo
source $BASH_CUSTOM_FUNCTIONS_FILE

CURRENT_DIR=$(pwd)

#···············································································
#   SETUP LINKED CONFIG FILES
#···············································································
lnif '/z/750/dot/repos/tty-gnome-terminator/config/config_compiled.ini' \
'/z/750/dot/repos/tty-gnome-terminator/config/linked_dir/config'

#···············································································
#   SETUP LINKED CONFIG DIRECTORIES
#···············································································
lnif '/z/750/dot/repos/tty-gnome-terminator/config/linked_dir' \
'/home/rigel/.config/terminator'

#···············································································
#   SETUP AUX ITEMS
#···············································································

lnif '/z/750/dot/repos/tty-gnome-terminator/aux/workstation/desktop_entries/terminator.desktop_actions.ini' \
'/z/750/dot/repos/workstation-arbitrary/config/generic/freedesktop/desktop_entries/launchers_editable/terminator.desktop_actions.ini'

lnif '/z/750/dot/repos/tty-gnome-terminator/aux/workstation/fish_functions/rebuild_terminator.fish' \
'/z/750/dot/repos/shell-fish/config/workstation/generic/ln_src_func_shared/functions/open/misc/rebuild_terminator.fish'

#···············································································
cd $CURRENT_DIR
