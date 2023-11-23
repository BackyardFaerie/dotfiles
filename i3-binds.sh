sed -n '/##KEYBIND-LIST-START/,/##KEYBIND-LIST-END/p' .config/i3/config | \
	grep -v \# | grep bindsym | sed -e 's/^[bindsym \ ]*//' \
	-e 's/^$mod*/Super/' -e 's/Mod1/Alt/' -e 's/Print/PrtSc/' \
	-e 's/ exec / /' -e 's/"//g' \
	-e 's/--no-startup-id//' | \
	yad --text-info --back=#000000 --fore=#ffffff --geometry=600x600
