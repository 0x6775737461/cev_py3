#!/usr/bin/env bash

what_exercise(){
	: "
	Asks to the user, what exercise that he's
	currently doing, but.. first the script
	checks if there's any directory that has 
	an exercise in development.
	"

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

	check_dirs 
}

check_dirs() {
	: "
	Checks if the user has solved some exercises,
	this check is done in sequential order. 
	"

	local exerc_path
	local exerc_dir
	
	#TODO: take the path dinamically
	exerc_path='../'

	#TODO: this atribution is usable only to [0-9], fix this
	# to works in situations like ex([0-9]){3}
	exerc_dir="ex00${exerc_num}"

	for (( i=0; i<="$exerc_num"; i++)); do
		# if the dir not exists
		if [ ! -d "${exerc_path}${exerc_dir}" ]; then
			#TODO: choose the language based on line number,
			#looks hard coded thing; dev a func to do this
			echo -e "$(sed -n "$(( language + 3 ))p" $data_path)"
			echo '[dev] create_dir()'
			return 0
		fi
	done

	echo '[dev] attribute_file_names()'

	return 0
}

foo='''
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
