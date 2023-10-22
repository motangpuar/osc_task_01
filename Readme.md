# OAI Setup and Integration (F1AP, RFSim Mode)

## Introduction

1. Configuration files are placed under `etc/` currently there are two of them (CU & DU).
2. Use `create_tunnel.sh` script to generate the necessary interfaces. Use `create` argument to create the interfaces and `clean` argument to clean.

## How To

1. Start CU with F1AP midhaul.
    `sudo {your_build_path}/nr-softmodem -o etc/gnb.cu.conf --sa --rfsim --log_config.global_log_options level,nocolor,time`
2. Start DU with F1AP midhaul and simulator radio parameters.
    `sudo {your_build_path}/nr-softmodem -o etc/gnb.du.conf --sa --rfsim --log_config.global_log_options level,nocolor,time`
3. Start the nrUE
    `{your_build_path}/nr-uesoftmodem -O etc/nr-ue.conf --sa --rfsim -r 106 --numerology 1 -C 3619200000 --nokrnmod --log_config.global_log_options level nocolor time`

## To Do

- [ ] Better parameter injection. Avoid hardcode the parameters on the config files.
- [ ] Environment variable based `oai5g` binary
