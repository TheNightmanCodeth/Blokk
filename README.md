# Blokk

A jailbreak utility for blocking alphanumeric senders. [See this reddit post for more info.](https://www.reddit.com/r/jailbreak/comments/sjetl8/comment/hveer4u/?utm_source=share&utm_medium=web2x&context=3)

# Installing

Until I package everything up into a `.deb`, this is the installation procedure:

- Copy `Blokk.app` from the releases section to `/Applications` on your jailbroken iPhone
- SSH into the device or use `NewTerm` and run the following commands:
  - `chmod 6777 /Applications/Blokk.app/Runner`
  - `chown root:admin /Applications/Blokk.app/Runner`
- Respring/Run UICache

Keep in mind you **will need to reboot after adding to the blocklist**
