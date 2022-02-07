#!/bin/sh

echo "Welcome to Nyaleph's and Dodloon's confloose installer!"
echo "Here is the current list of all our conflooses:"
echo

path="https://raw.githubusercontent.com/RemiSEGARD/Conflooses/master/"
conflooses="say_please i3_shake salut mec bite"

write_conflooses ()
{
    i='1'
    for conf in $conflooses; do
        len="$(echo -n $i')' $conf | wc -c)"
        len="$((20-len))"
        echo -n $i')' $conf
        for tmp in $(seq $len); do echo -n ' '; done
        if [ $((i%4)) = 0 ]; then echo ; fi
        i="$((i+1))"
    done
    echo
}

write_conflooses

echo
echo -n "Please choose your conflooses (ex: '1 3 5'): "
read choices

install_conflooses ()
{
    i='1'
    read -r -a confloose_names <<< "$conflooses"
    for conf in $choices; do
        curl "${path}"${confloose_names[$((conf-1))]}
    done
}

install_conflooses

echo
