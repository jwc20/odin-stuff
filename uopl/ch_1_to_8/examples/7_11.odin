package uopl 


read_file :: proc() {
	f, err := os.open("file.txt")

	if err != os.ERROR_NONE {
		// handle error
	}

	defer os.close(f)
}