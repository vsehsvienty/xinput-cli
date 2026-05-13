#!/bin/bash

# xinput list choose
mapfile -t xin_list < <(xinput | sed  's/⎜   ↳ /''/g; s/[[:space:]]*id=.*//')

printf "$(xinput | nl -v 0 -w2 -s': ') \n\n"  

read -p  "choose a device: " input_1
echo "your device is: ${xin_list[$input_1]}"

mapfile -t xin_props_list < <(xinput list-props "${xin_list[input_1]}" | sed 's/[[:space:]]/''/; s/[[:space:]]*(.*//')

printf "$(xinput list-props "${xin_list[input_1]}" | nl -v 0 -w2 -s': ') \n\n"

read -p "choose an option: " input_2

echo "u've choosed: ${xin_props_list[$input_2]}"
echo "now command is: xinput set-prop \"${xin_list[$input_1]}\" \"${xin_props_list[$input_2]}\" \"new prop\""
read -p "new prop is: " input_3

xinput set-prop "${xin_list[$input_1]}" "${xin_props_list[$input_2]}" ""$input_3""

echo "xinput set-prop \"${xin_list[$input_1]}\" \"${xin_props_list[$input_2]}\" \"$input_3\"" 




