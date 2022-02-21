# Blokk

A jailbreak app that brings back the ability to block alphanumeric senders (ie. email addresses).

# Installing [![Codemagic build status](https://api.codemagic.io/apps/6213da6dff12ccf6a45b90ae/6213da6dff12ccf6a45b90ad/status_badge.svg)](https://codemagic.io/apps/6213da6dff12ccf6a45b90ae/6213da6dff12ccf6a45b90ad/latest_build)

Until I package everything up into a `.deb`, this is the installation procedure:

- Copy `Blokk.app` from the releases section to `/Applications` on your jailbroken iPhone
- SSH into the device or use `NewTerm` and run the following commands:
  - `su` <- Enter your root password after this. It's `alpine` if you haven't changed it
  - `chmod 6777 /Applications/Blokk.app/Blokk`
  - `chown root:admin /Applications/Blokk.app/Blokk`
- Respring/Run UICache

Keep in mind you **will need to reboot after adding to the blocklist**
