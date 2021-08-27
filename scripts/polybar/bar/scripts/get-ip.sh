#!/bin/bash

echo $(ip -4 addr show enp5s0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | cut -d '.' -f4)
