#!/bin/bash
     curl -fsSL https://get.sui.io | bash -s -- --version 1.37.0
     echo 'source $HOME/.sui/env' >> $HOME/.bashrc