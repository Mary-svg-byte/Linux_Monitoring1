#!/bin/bash

source ./get_info/get_simple_info.sh
source ./get_info/get_net.sh
source ./get_info/get_ram.sh
source ./get_info/get_root_space.sh

source ./output.sh

source ./saving_to_file.sh

output_all
save_to_file