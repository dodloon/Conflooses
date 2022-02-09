#!/bin/sh

echo "Welcome to Nyaleph's and Dodloon's confloose installer!"
echo -e "Here is the current list of all our conflooses:\n"

path="https://raw.githubusercontent.com/RemiSEGARD/Conflooses/master/"
conflooses="say_please i3_shake salut mec"

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

echo -ne "\nPlease choose your conflooses (ex: '1 3 5'): "
read choices

echo -ne "Where would you like to install the conflooses? (empty for .): "
read -e install_path
echo

if [ ! -d "${install_path}.looses" ]; then mkdir .looses; fi

touch "${install_path}.looses/loose_manager"

install_conflooses ()
{
    i='1'
    read -r -a confloose_names <<< "$conflooses"
    for conf in $choices; do
        echo "Downloading ${confloose_names[$((conf-1))]}..."
        curl "${path}"${confloose_names[$((conf-1))]} > "${install_path}.looses/${confloose_names[$((conf-1))]}" 2> /dev/null
        echo "source ${confloose_names[$((conf-1))]}" >> "${install_path}.looses/loose_manager"
    done
}

install_conflooses

generate_case ()
{
    case='case "$(($RANDOM % '
    nb_cfl=$(echo "$choices" | wc -w)
    echo "What would you like the chance for a confloose to happen when starting a"
    echo -n "terminal? (minimum is $nb_cfl, leave empty for minimum): "
    read nb_input
    if [ ! -z "$nb_input" ] && [ "$nb_input" -lt "$nb_cfl" ]; then
        echo "Invalid input, ignoring..."
    elif [ ! -z "$nb_input" ]; then
        nb_cfl="$nb_input"
    fi

    case="${case}${nb_cfl}))\" in
"
    i='0'
    read -r -a confloose_names <<< "$conflooses"
    for conf in $choices; do
        case="${case}    ${i})
        export PROMPT_COMMAND='${confloose_names[$((conf-1))]}'
        ;;
"
        i="$((i + 1))"
    done
    case="${case}esac"
    echo -e "\n$case" >> "${install_path}.looses/loose_manager"
}

generate_case

# TODO : choose where to source loose_manager

echo "Everything's setup!"
