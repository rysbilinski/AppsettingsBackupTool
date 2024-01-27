# AppSettings Backup Tool

## Motivation

I need to wipe my lappers and as a developer, most if not all my data is in the cloud! 

EXCEPT my dev config files for development. It's such a pain to recreate these, so me and my team (read ChatGPT & I) created this quick tool

## Overview

The `AppSettings Backup Tool` is a PowerShell script designed to find and backup `appsettings.*.json` configuration files from a specified source directory to a target directory. The script searches for these files recursively, excluding any files located within `bin` or `obj` directories. Each copied file is prefixed with the name of the folder it was found in to ensure uniqueness and maintain a trace of its origin.

## Features

- [X] Recursively searches for `application.*.json` files in the specified source directory.
- [x] Excludes files within `bin` or `obj` directories.
- [x] Copies found files to a specified target directory.
- [x] Prefixes filenames with the name of their source subdirectory for easy identification.
- [x] Supports relative paths for both source and target directories.
- [x] Provides command-line arguments for easy automation and integration with other tools.
- [ ] allow for different names of config file not just appsettings
- [ ] add a suffix to the output folder perhaps date
- [ ] zip the output folder
- [ ] add a script that creares a scheduled task so this can be run weekly?

## Prerequisites

- PowerShell 5.0 or higher.

## Usage

### Basic Usage

To run the script, navigate to the script's directory and execute it via PowerShell, providing the source and target directories:

```bash
powershell.exe -File AppSettingsBackupTool.ps1 -sourceDirectory "<source-path>" -targetDirectory "<target-path>"
