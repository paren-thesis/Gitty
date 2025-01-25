#!/bin/bash

# Colors for display
CYAN="$(printf '\033[36m')"
GREEN="$(printf '\033[32m')"
ORANGE="$(printf '\033[33m')"
BLUE="$(printf '\033[34m')"
RED="$(printf '\033[31m')"
RESETBG="$(printf '\e[0m\n')"

# Display Branch Management Menu
branch_menu() {
    clear
    echo "${CYAN}Branch Management Commands:"
    echo -e "${GREEN}1. Create a branch: ${ORANGE}git checkout -b branch_name"
    echo -e "${GREEN}2. Delete a branch: ${ORANGE}git branch -d branch_name"
    echo -e "${GREEN}3. Merge a branch: ${ORANGE}git merge branch_name"
    echo -e "${GREEN}4. List all branches: ${ORANGE}git branch"
    echo -e "${GREEN}5. Switch to a branch: ${ORANGE}git checkout branch_name"
    echo -e "${GREEN}0. Back to Main Menu"
    echo
}

# Function to create a branch
create_branch() {
    read -p "Enter the name of the new branch: " branch_name
    git checkout -b "$branch_name"
    if [ $? -eq 0 ]; then
        echo "${GREEN}Branch '$branch_name' created successfully!${RESETBG}"
    else
        echo "${RED}Failed to create branch '$branch_name'.${RESETBG}"
    fi
}

# Function to delete a branch
delete_branch() {
    read -p "Enter the name of the branch to delete: " branch_name
    git branch -d "$branch_name"
    if [ $? -eq 0 ]; then
        echo "${GREEN}Branch '$branch_name' deleted successfully!${RESETBG}"
    else
        echo "${RED}Failed to delete branch '$branch_name'.${RESETBG}"
    fi
}

# Function to merge a branch
merge_branch() {
    read -p "Enter the name of the branch to merge: " branch_name
    git merge "$branch_name"
    if [ $? -eq 0 ]; then
        echo "${GREEN}Branch '$branch_name' merged successfully!${RESETBG}"
    else
        echo "${RED}Failed to merge branch '$branch_name'.${RESETBG}"
    fi
}

# Function to list all branches
list_branches() {
    echo "${CYAN}Listing all branches:${RESETBG}"
    git branch
}

# Function to switch to a branch
switch_branch() {
    read -p "Enter the name of the branch to switch to: " branch_name
    git checkout "$branch_name"
    if [ $? -eq 0 ]; then
        echo "${GREEN}Switched to branch '$branch_name' successfully!${RESETBG}"
    else
        echo "${RED}Failed to switch to branch '$branch_name'.${RESETBG}"
    fi
}

# Menu Navigation
branch_management() {
    while true; do
        branch_menu
        read -p "Select an option (0 to go back): " option
        case $option in
            1) create_branch ;;
            2) delete_branch ;;
            3) merge_branch ;;
            4) list_branches ;;
            5) switch_branch ;;
            0) break ;;
            *) echo "${RED}Invalid option! Please try again.${RESETBG}" ;;
        esac
        read -p "${BLUE}Press [Enter] to continue...${RESETBG}"
    done
}

branch_management
