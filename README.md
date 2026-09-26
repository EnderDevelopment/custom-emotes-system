# Custom Emotes System

Enhance your FiveM roleplay server with a customizable emotes system.

## Features

- NUI menu for easy emote selection
- Command-based system for quick access
- Admin commands to add new emotes
- Search and filter functionality
- Category-based organization

## Requirements

- FiveM server
- ESX Framework
- MySQL-Async

## Installation

1. Download the script and place it in your FiveM server's `resources` folder.
2. Add `start custom_emotes` to your server.cfg file.
3. Import the `database.sql` file into your MySQL database.

## Usage

### Commands

| Command | Description | Permission |
|---------|-------------|------------|
| /emote | Opens the emote menu | None |
| /addemote [name] [dict] [anim] [category] | Adds a new emote | Admin |

### Permissions

- Admins can use the `/addemote` command to add new emotes to the system.

## Configuration

The script can be configured in the `config.lua` file. You can change the command to open the emote menu and add default emotes.

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=custom-emotes-system&utm_content=bottom) — describe it in one sentence and get the full source code.