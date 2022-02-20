#!/usr/bin/env bash

# the below method is from: https://stackoverflow.com/a/4774063
readonly SCRIPPATH=\
"$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

what_exercise(){
	: "
	Asks to the user, what exercise that he's
	currently doing, but.. first the script
	checks if there's any directory that has 
	an exercise in development.
	"

	local data_path
	local exerc_num

	data_path="${SCRIPPATH%/*}/data/questions.txt"

	# asking to the user, based on your language
	read -p "$(sed -n "${language}p" $data_path) [0, 1, 2, ...] " \
		exerc_num
	
	if (( exerc_num == 0 )); then
		exerc_num=1
	fi

	check_dirs 

	return 0
}

check_dirs() {
	: "
	Checks if the user has solved some exercises,
	this check is done in sequential order. 
	"

	local exerc_path
	local exerc_dir
	local exerc_dir_path
	
	exerc_path="${SCRIPPATH%/*}"

	#TODO: this atribution is usable only to [0-9], fix this
	# to works in situations like ex([0-9]){3}
	exerc_dir="ex00${exerc_num}"

	exerc_dir_path="${exerc_path}/${exerc_dir}"

	for (( i=0; i<="$exerc_num"; i++)); do
		# if the dir not exists
		if ! test -d "$exerc_dir_path"; then
			#TODO: choose the language based on line number,
			#looks hard coded thing; dev a func to do this
			echo -e "$(sed -n "$(( language + 3 ))p" $data_path)"

			create_dir

			return 0
		fi
	done

	create_dir

	return 0
}

create_dir(){
	: "
	Creating the directory that includes the python files,
	this creation is based on exercise number.
	"

	if ! test -d "$exerc_dir_path"; then
		#TODO: this actions depends the second check_dirs() todo.
		mkdir "$exerc_dir_path"
	fi

	attribute_file_names
}

attribute_file_names(){
	: "
	Take ../data/file_names.txt data and create the file
	"

	local file_names_path
	local file_name
	local file_to_create

	file_names_path="${SCRIPPATH%/*}/data/file_names.txt"

	file_name=$(sed -n "${exerc_num}p" $file_names_path |
		awk '{ print $3 }')

	file_to_create="${exerc_dir_path}/$file_name"

	if ! test -f "$file_to_create"; then
		> "$file_to_create"
	fi

	return 0
}

foo='''
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
	while (( language < 1 )) || (( language > 2 ))
	do
		echo -e "1. [pt-br]\n2. [en-us]\n: "
		read language
	done

	what_exercise 
}

main "$@"
