create_file 'example.txt'
modify_file 'example.txt', append_data: "Lorem ipsum dolor sit amet\n"
delete_file 'example.txt'
transmit_data 'example.com', 80, data: "GET / HTTP/1.1\nHost: example.com\n\n"
run_process 'echo', 'hello world'
run_process 'cal'
