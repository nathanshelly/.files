#! /usr/bin/env bash

jq --arg KEY "$1" '.[$KEY]' < "$DOTFILES/.files-settings.json"
