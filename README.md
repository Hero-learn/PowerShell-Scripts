# Active Directory User Management Script

## Overview
This PowerShell script provides a set of functions for managing Active Directory (AD) user accounts. It allows IT administrators to automate tasks such as creating new users, resetting passwords, enabling/disabling user accounts, adding users to groups, and generating user account reports. By using this script, repetitive administrative tasks can be automated, improving efficiency and reducing errors.

## Features
- **Create-NewUser**: Automates the process of creating new AD users with specified attributes (e.g., username, full name, password).
- **Reset-UserPassword**: Resets user passwords in Active Directory.
- **Enable-UserAccount**: Enables disabled user accounts in AD.
- **Disable-UserAccount**: Disables active user accounts in AD.
- **Add-UserToGroup**: Adds users to specified AD groups.
- **Generate-UserReport**: Generates a CSV report of user accounts, including details like last logon date and account status.

## Prerequisites
- **PowerShell**: This script uses PowerShell 5.1 or later.
- **Active Directory Module**: Ensure that the Active Directory module for PowerShell is installed. The module is usually available in Windows Server editions or can be installed through RSAT (Remote Server Administration Tools) for Windows client editions.

## Setup and Usage



