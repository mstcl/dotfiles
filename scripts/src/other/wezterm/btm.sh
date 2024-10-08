#!/usr/bin/env bash

i3-msg workspace "11:A" && wezterm start --class "whole" -e "btm" && i3-msg workspace back_and_forth
