#!/bin/bash
current_dir=$PWD
cd $HOME/docker/rss
docker-compose up -d
cd $current_dir
