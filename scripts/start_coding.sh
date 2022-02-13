#!/usr/bin/env bash

what_exercise(){
	: "
	Asks to the user, what exercise that he's
	currently doing, but.. first the script
	checks if there's any directory that has 
	an exercise in development.
	"
	# $1 = $language
	local data_path
	local exerc_num

	#TODO: take the path dinamically
	data_path='../data/questions.txt'

	# asking to the user, based on your language
	read -p "$(sed -n "${language}p" $data_path) [0, 1, 2, ...] " \
		exerc_num
	
	if (( $exerc_num == 0 )); then
		echo "[dev] create_dir()"
	fi

	echo "[dev] check_dirs()"
}

foo='''
check_dirs() {

}

create_dir(){
	: "
	...
	"
}

attribute_file_names(){
	: "
	...
	"
}

open_vim(){
	: "
	...
	"
}
'''

main(){
	local language
	language=0

	# asks to the user what your language
	# 1 = pt-br
	# 2 = en-us
	while (( $language < 1 )) || (( $language > 2 ))
	do
		echo -e "1. [pt-br]\n2. [en-us]\n: "
		read language
	done

	what_exercise "$language"
}

main "$@"
