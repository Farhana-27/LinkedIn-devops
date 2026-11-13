# 🛡️ OverTheWire: Bandit Wargame — Level 0 to 20

My notes from working through **OverTheWire Bandit**, a hands-on wargame that teaches the Linux command line and security basics. Each level is a small puzzle: log in over SSH, find the password for the next level, and move on.

For each level I've written down **the challenge**, **the commands I used**, **why they work**, and **what I learned**.

> 🔒 Passwords are deliberately left out. OverTheWire asks players not to publish them, and the point of these notes is the method.

---

## 🧰 Skills Practised

| Area | Tools and concepts |
|---|---|
| **Remote access** | `ssh`, `scp`, SSH private keys, key permissions (`chmod 600`) |
| **Files and navigation** | `ls -a`, `ls -l`, `cat`, `cd`, `cp`, `mv`, hidden files, awkward file names |
| **Searching** | `find` (by size, owner, group, type), `grep`, wildcards |
| **Text processing** | pipes (`\|`), `sort`, `uniq`, `strings`, `diff`, `tr` |
| **Encoding and compression** | `base64`, ROT13, `xxd`, `gzip`, `bzip2`, `tar`, `file` |
| **Networking** | ports, `localhost`, `nc` (client and listener), `openssl s_client` (TLS), `nmap` port scanning |
| **Permissions and processes** | setuid programs, `whoami`, background jobs (`&`) |
| **Shell behaviour** | `.bashrc`, error redirection (`2>/dev/null`), running remote commands over SSH |

---

## 📑 Contents

[Level 0](#level-0) · [1](#level-1) · [2](#level-2) · [3](#level-3) · [4](#level-4) · [5](#level-5) · [6](#level-6) · [7](#level-7) · [8](#level-8) · [9](#level-9) · [10](#level-10) · [11](#level-11) · [12](#level-12) · [13](#level-13) · [14](#level-14) · [15](#level-15) · [16](#level-16) · [17](#level-17) · [18](#level-18) · [19](#level-19) · [20](#level-20)

---

## Level 0

**🎯 Challenge**
- Log in to the game server and find the password for Level 1.

**💻 Solution**
```bash
ssh bandit0@bandit.labs.overthewire.org -p 2220
ls
cat readme
```

**🔍 Explanation**
- The basic SSH format is `ssh <username>@<server> -p <port>`.
- `ls` listed the files in the home folder and showed `readme`.
- `cat` printed the contents of `readme`, which held the password.

**💡 What I learned**
- `ls` lists files and folders. `cat` reads the contents of a file.

---

## Level 1

**🎯 Challenge**
- The password is in a file called `-` in the home folder.

**💻 Solution**
```bash
cat ./-
```

**🔍 Explanation**
- `cat -` doesn't work, because `cat` reads a lone `-` as "read from the keyboard". It sat waiting until I pressed `Ctrl + C`.
- `./-` means "the file called `-` in this folder", so `cat` treats it as a file.

**💡 What I learned**
- Putting `./` in front of a file name stops it being mistaken for an option.

---

## Level 2

**🎯 Challenge**
- The password is in a file called `--spaces in this filename--` in the home folder.

**💻 Solution**
```bash
cat "./--spaces in this filename--"
```

**🔍 Explanation**
- **Spaces:** the shell splits arguments at spaces, so the quotes keep the whole name together as one argument.
- **Leading dashes:** `--` at the start makes `cat` think an option is coming. `./` in front makes it a path instead.
- `cat -- "--spaces in this filename--"` also works, because `--` tells a command that no more options follow.

**💡 What I learned**
- Quotes handle spaces in file names.
- `./` or `--` handles names that start with a dash.

---

## Level 3

**🎯 Challenge**
- The password is in a hidden file inside the `inhere` folder.

**💻 Solution**
```bash
cd inhere
ls -a
cat ...Hiding-From-You
```

**🔍 Explanation**
- Files whose names start with a dot are hidden, so plain `ls` doesn't show them.
- `ls -a` shows all files, including hidden ones. It revealed `...Hiding-From-You`, and the three dots are part of the name.
- No quotes or `./` were needed, because the name has no spaces and doesn't start with a dash.

**💡 What I learned**
- `ls -a` shows hidden files.
- `.` is the current folder and `..` is the parent folder.

---

## Level 4

**🎯 Challenge**
- The password is in the only human-readable file in the `inhere` folder.

**💻 Solution**
```bash
cd inhere
file ./*
cat ./-file07
```

**🔍 Explanation**
- `file` looks inside a file and reports what kind of data it holds.
- `*` is a wildcard. The shell replaces it with every file name in the folder.
- `./*` puts `./` in front of each name, so names starting with `-` aren't read as options.
- Only `-file07` showed as `ASCII text`, which is readable.

**💡 What I learned**
- `file` identifies a file's type without opening it.
- A wildcard lets one command check many files at once.

---

## Level 5

**🎯 Challenge**
- Find a file in `inhere` that is human-readable, exactly 1033 bytes and not executable.

**💻 Solution**
```bash
cd inhere
find . -type f -size 1033c ! -executable -exec file {} + | grep ASCII
cat ./maybehere07/.file2
```

**🔍 Explanation**
- `find .` searches the current folder and every folder inside it.
- `-type f` matches files only, not folders.
- `-size 1033c` matches exactly 1033 bytes. `c` means bytes, because `find` otherwise counts in 512-byte blocks.
- `! -executable` means "not executable". The `!` reverses the test after it.
- `-exec file {} +` runs `file` on every match. `{}` stands for the file names found.
- `| grep ASCII` keeps only the readable files.

**💡 What I learned**
- `find` can combine several conditions in one search.
- Its results can be passed to other commands.

---

## Level 6

**🎯 Challenge**
- Find a file somewhere on the server that is owned by user `bandit7` and group `bandit6`, and is 33 bytes.

**💻 Solution**
```bash
find / -type f -user bandit7 -group bandit6 -size 33c 2>/dev/null
cat /var/lib/dpkg/info/bandit7.password
```

**🔍 Explanation**
- `find /` starts at the root folder, so it searches the whole server.
- `-user bandit7` and `-group bandit6` match the owner and group.
- `-size 33c` matches exactly 33 bytes.
- `2>/dev/null` hides error messages. `2` is the error output, `>` redirects it, and `/dev/null` throws it away. This removed hundreds of "Permission denied" lines.

**💡 What I learned**
- `find` can search the whole system by owner and group.
- Redirecting errors to `/dev/null` keeps the output clean.

---

## Level 7

**🎯 Challenge**
- The password is in `data.txt`, next to the word `millionth`.

**💻 Solution**
```bash
cat data.txt | grep millionth
```

**🔍 Explanation**
- `du -b data.txt` showed the file was over 4 MB, which is far too big to read by eye.
- `cat` reads the file, and the pipe (`|`) sends its output into `grep`.
- `grep millionth` prints only the line containing that word.

**💡 What I learned**
- A pipe sends one command's output into another.
- `grep` finds lines in large files quickly.

---

## Level 8

**🎯 Challenge**
- The password is the only line in `data.txt` that appears just once.

**💻 Solution**
```bash
sort data.txt | uniq -u
```

**🔍 Explanation**
- `sort` puts the lines in order, so identical lines end up next to each other.
- `uniq -u` prints only the lines that aren't repeated.
- `sort` has to come first, because `uniq` only compares lines that are next to each other.

**💡 What I learned**
- `uniq` removes duplicate lines, `-u` shows lines that appear once, `-d` shows repeated lines, and `-c` counts how many times each appears.

---

## Level 9

**🎯 Challenge**
- The password is in `data.txt`, in one of the few readable strings, preceded by several `=` characters.

**💻 Solution**
```bash
strings data.txt | grep ===
```

**🔍 Explanation**
- The file is mostly binary, so `cat` prints garbage.
- `strings` pulls out only the readable text.
- `grep ===` keeps only the lines containing `===`.

**💡 What I learned**
- `strings` extracts readable text from binary files.

---

## Level 10

**🎯 Challenge**
- The password is in `data.txt`, which contains base64-encoded data.

**💻 Solution**
```bash
base64 -d data.txt
```

**🔍 Explanation**
- Base64 writes data using only letters, numbers, `+`, `/` and `=`, so it looks scrambled.
- `-d` decodes it back to the original text.

**💡 What I learned**
- A random-looking string that often ends in one or two `=` signs is usually base64.

---

## Level 11

**🎯 Challenge**
- The password is in `data.txt`, where every letter has been rotated by 13 positions (ROT13).

**💻 Solution**
```bash
cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'
```

**🔍 Explanation**
- `tr` swaps each character in the first set for the one in the same position in the second set.
- The second set is the alphabet starting at N and wrapping round, so A becomes N, B becomes O, and so on.
- The alphabet has 26 letters, so the same command both encodes and decodes.

**💡 What I learned**
- ROT13 is a simple letter-shift cipher.
- `tr` can translate one set of characters into another.

---

## Level 12

**🎯 Challenge**
- `data.txt` is a hexdump of a file that has been compressed many times.

**💻 Solution**
```bash
cd $(mktemp -d)
cp ~/data.txt .
xxd -r data.txt > data
file data              # gzip
mv data data.gz && gzip -d data.gz
file data              # bzip2
mv data data.bz2 && bzip2 -d data.bz2
file data              # gzip
mv data data.gz && gzip -d data.gz
file data              # tar
mv data data.tar && tar -xf data.tar
file data6.bin         # bzip2
mv data6.bin data.bz2 && bzip2 -d data.bz2
file data              # tar
tar -xf data
file data8.bin         # gzip
mv data8.bin data.gz && gzip -d data.gz
file data              # ASCII text
cat data
```

**🔍 Explanation**
- `mktemp -d` made a temporary folder to work in, because I couldn't create files in the home folder.
- `xxd -r` reversed the hexdump back into the original binary file.
- Then I repeated one pattern: **check the type with `file`, then decompress with the matching tool.**
  - gzip: rename to `.gz`, then `gzip -d`
  - bzip2: rename to `.bz2`, then `bzip2 -d`
  - tar: `tar -xf`, then `ls` to find the new file

**⚠️ Problems I solved**
- **`mkdir` failed:** I'd typed several commands on one line. Fixed by entering one command per line.
- **`cannot stat 'data.txt'`:** I was in the wrong folder. Fixed with the full path, `~/data.txt`.
- **`Permission denied`:** I was still in the home folder. Fixed by checking with `pwd` and moving into the temporary folder.
- **`data already exists`:** an old file had the same name. It was no longer needed, so I overwrote it.

**💡 What I learned**
- Use `file` to identify an unknown file before choosing a tool.
- `pwd` tells you where you are when a command fails.
- "No such file" usually means the wrong folder, and "Permission denied" means you can't write there.

---

## Level 13

**🎯 Challenge**
- The password is in `/etc/bandit_pass/bandit14` and only `bandit14` can read it. Instead of a password, I'm given a private SSH key.

**💻 Solution**
```bash
# On the Bandit server
ls
cat HINT
exit

# On my Mac
scp -P 2220 bandit13@bandit.labs.overthewire.org:sshkey.private .
chmod 600 sshkey.private
ssh -i sshkey.private bandit14@bandit.labs.overthewire.org -p 2220
cat /etc/bandit_pass/bandit14
```

**🔍 Explanation**
- The hint explained that the server blocks SSH to itself, so the key has to be used from my own computer.
- `scp` (secure copy) downloads files over SSH. It uses a capital `-P` for the port.
- `chmod 600` lets only me read the key. SSH refuses keys that others could read.
- `ssh -i` uses the key file as my identity instead of a password.

**💡 What I learned**
- SSH keys can replace passwords for logging in.
- Private keys must have strict permissions.
- `scp` uses `-P` and `ssh` uses `-p`.

---

## Level 14

**🎯 Challenge**
- Get the next password by sending the current password to port 30000 on `localhost`.

**💻 Solution**
```bash
cat /etc/bandit_pass/bandit14 | nc localhost 30000
```

**🔍 Explanation**
- `localhost` means "this machine", here the Bandit server itself.
- A **port** is a numbered door that a service listens on.
- `nc` (netcat) opens a plain connection to a port, sends what it's given and prints the reply.

**💡 What I learned**
- Programs communicate over the network through ports.
- `nc` can send and receive data on any port.
- A pipe can feed a command's output straight into a network connection.

---

## Level 15

**🎯 Challenge**
- Send the current password to port 30001 on `localhost`, using SSL/TLS encryption.

**💻 Solution**
```bash
cat /etc/bandit_pass/bandit15 | openssl s_client -connect localhost:30001 -quiet
```

**🔍 Explanation**
- **TLS (Transport Layer Security)** encrypts a connection so nobody in between can read or change it. SSL (Secure Sockets Layer) is the older version.
- `nc` only sends plain text, so it can't talk to this service.
- `openssl s_client` performs the TLS handshake, then works like `nc`.
- `-quiet` hides the handshake output and stops lines starting with `R` or `Q` being read as commands.

**💡 What I learned**
- The difference between plain and encrypted connections.
- A self-signed certificate gives a warning but still encrypts the connection.

---

## Level 16

**🎯 Challenge**
- One service on ports 31000 to 32000 returns the next level's credentials when sent the current password.

**💻 Solution**
```bash
nmap -p 31000-32000 localhost
nmap -sV -p 31000-32000 localhost
cat /etc/bandit_pass/bandit16 | openssl s_client -connect localhost:31790 -quiet
exit

# On my Mac, after copying the returned key
pbpaste > bandit17.key
echo >> bandit17.key
chmod 600 bandit17.key
ssh -i bandit17.key bandit17@bandit.labs.overthewire.org -p 2220
```

**🔍 Explanation**
- `nmap` scanned the range for open ports.
- `-sV` identified each service. The `ssl/unknown` port was the real one, and the others were echo decoys.
- The service replied with a private SSH key, not a password.
- `pbpaste >` saved the copied key into a file on my Mac.
- `echo >>` added a missing line break at the end of the file, because without it SSH rejected the key and asked for a password.

**💡 What I learned**
- `nmap` finds open ports, and `-sV` shows what's running on them.
- Not every open port is useful, so each one needs testing.
- In the Mac terminal, a `%` after `cat` output means the file has no final line break.

---

## Level 17

**🎯 Challenge**
- `passwords.old` and `passwords.new` differ by one line. The changed line is the password.

**💻 Solution**
```bash
diff passwords.old passwords.new
```

**🔍 Explanation**
- `diff` compares two files line by line and shows only the differences.
- The output looked like this:
  ```
  42c42
  < (old line)
  ---
  > (new line: the password)
  ```
- `42c42` means line 42 changed. `<` is the first file and `>` is the second.

**💡 What I learned**
- `diff` shows exactly what changed between two files.
- The order matters: old file first, new file second.

---

## Level 18

**🎯 Challenge**
- The password is in `readme`, but `.bashrc` has been changed to log me out as soon as I log in.

**💻 Solution**
```bash
ssh bandit18@bandit.labs.overthewire.org -p 2220 cat readme
```

**🔍 Explanation**
- `.bashrc` is a hidden file that runs every time an interactive shell starts.
- Adding a command after the SSH address runs only that command, so no interactive shell starts and `.bashrc` never runs.
- Another way is `ssh … -t /bin/sh`, which opens a different shell that ignores `.bashrc`.

**💡 What I learned**
- How shell start-up files work.
- How to run a single command on a remote server over SSH.

---

## Level 19

**🎯 Challenge**
- Use the setuid program in the home folder to read the next password from `/etc/bandit_pass`.

**💻 Solution**
```bash
ls -l
./bandit20-do
./bandit20-do cat /etc/bandit_pass/bandit20
```

**🔍 Explanation**
- `ls -l` showed `bandit20-do` with an `s` in its permissions (`rws`), meaning setuid is on, and showed that it's owned by `bandit20`.
- Running it with no arguments explained how to use it: it runs whatever command you give it.
- A setuid program runs as its **owner**, not as the person running it. So `cat` ran as `bandit20`, which is allowed to read the password file.

**💡 What I learned**
- What setuid is and how to spot it in `ls -l` output.
- `./` runs a program in the current folder.
- `whoami` shows which user a command is running as.

---

## Level 20

**🎯 Challenge**
- A setuid program, `suconnect`, connects to a port I choose, reads a line and, if it's the current password, sends back the next one. Nothing is listening, so I have to set up the listener myself.

**💻 Solution**
```bash
./suconnect
cat /etc/bandit_pass/bandit20 | nc -l -p 4444 &
./suconnect 4444
```

**🔍 Explanation**
- Running `./suconnect` on its own showed how it works.
- `nc -l -p 4444` made netcat **listen** on port 4444 as a server, instead of connecting out as a client.
- Piping in the current password meant the listener would send it to whatever connected.
- `&` ran the listener in the background, so I could use the same terminal for the next command.
- `./suconnect 4444` connected to my listener, received the correct password and sent back the next one.
- Any free port above 1024 works, as long as both commands use the same number.

**💡 What I learned**
- `nc -l` turns netcat into a listener (server).
- `&` runs a command in the background.
- Both sides of a connection must use the same port.
- Ports below 1024 are reserved for system services.

