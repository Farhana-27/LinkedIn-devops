# 🏟️ Level 1: The Basics

**Mission:** Create a directory named `Arena`, then inside it create three files: `warrior.txt`, `mage.txt` and `archer.txt`. List the contents of the `Arena` directory.

---

## Step 1: Create the directory

```bash
mkdir Arena
```
**Why:** `mkdir` (make directory) creates a new folder called `Arena`.

## Step 2: Move into the directory

```bash
cd Arena
```
**Why:** `cd` (change directory) moves you inside `Arena`, so the files get created there.

## Step 3: Create the three files

```bash
touch warrior.txt mage.txt archer.txt
```
**Why:** `touch` creates empty files. Listing several names creates them all in one command.

## Step 4: List the contents

```bash
ls
```
**Why:** `ls` (list) shows what's inside the current directory, which confirms the files were created.

## ✅ Output

```
archer.txt  mage.txt  warrior.txt
```

# Level 2: Variables and Loops

**Mission:** Create a script that outputs the numbers 1 to 10, one number per line.

---

## Step 1: Create the file

```bash
touch count.sh
```
**Why:** `touch` creates a new, empty file to hold the script.

## Step 2: Open it in Vim

```bash
vim count.sh
```
**Why:** Vim is a terminal text editor, used here to write the script.

## Step 3: Write the script

Press `i` to start typing, then add:

```bash
#!/bin/bash

for i in {1..10}
do
  echo $i
done
```

**Why:**
- `#!/bin/bash` tells the system to run the file with Bash.
- `for i in {1..10}` loops through the numbers 1 to 10.
- `echo $i` prints each number on its own line.

Save and exit with `Esc` → `:wq` → `Enter`.

## Step 4: Make it executable

```bash
chmod +x count.sh
```
**Why:** New files can't be run by default. `chmod +x` gives permission to execute the file.

## Step 5: Run the script

```bash
./count.sh
```
**Why:** `./` runs the script from the current folder.

## ✅ Output

```
1
2
3
4
5
6
7
8
9
10
```

# 🦸 Level 3: Conditional Statements

**Mission:** Write a script that checks if a file named `hero.txt` exists in the `Arena` directory. If it does, print `Hero found!`; otherwise, print `Hero missing!`.

---

## Step 1: Move into the Arena directory

```bash
cd Arena
```
**Why:** The script checks the folder it's run from, so it needs to be run inside `Arena`.

## Step 2: Create the script file

```bash
touch hero.sh
```
**Why:** `touch` creates an empty file to hold the script.

## Step 3: Write the script in Vim

```bash
vim hero.sh
```

Press `i` to start typing, then add:

```bash
#!/bin/bash

if [ -f hero.txt ]; then
  echo "Hero found!"
else
  echo "Hero missing!"
fi
```

**Why:**
- `if [ ... ]; then` runs the next line only if the check is true.
- `-f` checks whether the file exists.
- `else` runs when the check is false.
- `fi` ends the `if` statement.

Save and exit with `Esc` → `:wq` → `Enter`.

## Step 4: Make it executable

```bash
chmod +x hero.sh
```
**Why:** Gives the file permission to run as a program.

## Step 5: Run the script

```bash
./hero.sh
```
**Why:** `./` runs the script from the current folder.

**Output:**
```
Hero missing!
```
`hero.txt` doesn't exist yet, so the `else` branch runs.

## Step 6: Create the hero and run again

```bash
touch hero.txt
./hero.sh
```
**Why:** Tests the other branch of the `if` statement.

**Output:**
```
Hero found!
```
# 💾 Level 4: File Manipulation

**Mission:** Create a script that copies all `.txt` files from the `Arena` directory to a new directory called `Backup`.

---

## Step 1: Move into the Arena directory

```bash
cd Arena
```
**Why:** The script works on the folder it's run from, so it needs to be run inside `Arena`.

## Step 2: Create the script file

```bash
touch backup.sh
```
**Why:** `touch` creates an empty file to hold the script.

## Step 3: Write the script in Vim

```bash
vim backup.sh
```

Press `i` to start typing, then add:

```bash
#!/bin/bash

mkdir -p backup
cp *.txt backup/
echo "Backup complete!"
```

**Why:**
- `mkdir -p backup` creates the `backup` folder. `-p` prevents an error if it already exists.
- `cp *.txt backup/` copies every `.txt` file into `backup`. `*` is a wildcard meaning "any name".
- `echo` prints a message to confirm the script finished.

Save and exit with `Esc` → `:wq` → `Enter`.

## Step 4: Make it executable

```bash
chmod +x backup.sh
```
**Why:** Gives the file permission to run as a program.

## Step 5: Run the script

```bash
./backup.sh
```
**Why:** `./` runs the script from the current folder.

**Output:**
```
Backup complete!
```

## Step 6: Check the backup

```bash
ls backup
```
**Why:** Confirms the `.txt` files were copied into `Backup`.

**Output:**
```
archer.txt  hero.txt  mage.txt  warrior.txt
```

# ⚔️ Level 5: The Boss Battle - Combining Basics

**Mission:** Write a script that:
1. Creates a directory named `Battlefield`
2. Inside `Battlefield`, creates `knight.txt`, `sorcerer.txt` and `rogue.txt`
3. Checks if `knight.txt` exists and, if it does, moves it to a new directory called `Archive`
4. Lists the contents of both `Battlefield` and `Archive`

---

## Step 1: Move into the Arena directory

```bash
cd Arena
```
**Why:** Keeps all the game files together in one place.

## Step 2: Create the script file

```bash
touch boss.sh
```
**Why:** `touch` creates an empty file to hold the script.

## Step 3: Write the script in Vim

```bash
vim boss.sh
```

Press `i` to start typing, then add:

```bash
#!/bin/bash

# 1. Create the Battlefield directory
mkdir -p Battlefield

# 2. Create the three files inside it
touch Battlefield/knight.txt Battlefield/sorcerer.txt Battlefield/rogue.txt

# 3. If knight.txt exists, move it to Archive
if [ -f Battlefield/knight.txt ]; then
  mkdir -p Archive
  mv Battlefield/knight.txt Archive/
  echo "knight.txt moved to Archive"
else
  echo "knight.txt not found"
fi

# 4. List the contents of both directories
echo "Battlefield:"
ls Battlefield
echo "Archive:"
ls Archive
```

**Why:**
- `#` comments label each part of the mission. Bash ignores them.
- `mkdir -p` creates a folder without an error if it already exists.
- `Battlefield/knight.txt` works on a file inside a folder without needing to `cd` into it.
- `if [ -f ... ]` checks the file exists before moving it.
- `mv` moves the file, so it's removed from `Battlefield`.
- `ls` lists each folder's contents to confirm the result.

Save and exit with `Esc` → `:wq` → `Enter`.

## Step 4: Make it executable

```bash
chmod +x boss.sh
```
**Why:** Gives the file permission to run as a program.

## Step 5: Run the script

```bash
./boss.sh
```
**Why:** `./` runs the script from the current folder.

## ✅ Output

```
knight.txt moved to Archive
Battlefield:
rogue.txt  sorcerer.txt
Archive:
knight.txt
```
# 📜 Level 6: Argument Parsing

**Mission:** Write a script that accepts a filename as an argument and prints the number of lines in that file. If no filename is provided, display a message saying `No file provided`.

---

## Step 1: Create a test file

Create `scroll.txt` with 6 lines of text inside it.

**Why:** The script needs a file to count the lines of.

## Step 2: Create the script in Vim

```bash
vim count_lines.sh
```

Press `i` to start typing, then add:

```bash
#!/bin/bash

if [ -z "$1" ]; then
  echo "No file provided"
else
  lines=$(wc -l < "$1" | tr -d ' ')
  echo "$1 has $lines lines"
fi
```

**Why:**
- `$1` holds the first argument, the filename typed after the script name.
- `-z "$1"` checks whether no filename was given.
- `wc -l` counts the lines in the file.
- `tr -d ' '` removes the extra spaces macOS adds before the number.
- `lines=$( ... )` saves the result in a variable.
- Quotes around `"$1"` stop filenames with spaces from breaking the script.

Save and exit with `Esc` → `:wq` → `Enter`.

## Step 3: Make it executable

```bash
chmod +x count_lines.sh
```
**Why:** Gives the file permission to run as a program.

## Step 4: Run it with a filename

```bash
./count_lines.sh scroll.txt
```
**Why:** Tests that the script counts lines when a filename is given.

**Output:**
```
scroll.txt has 6 lines
```

## Step 5: Run it without a filename

```bash
./count_lines.sh
```
**Why:** Tests that the script handles a missing argument.

**Output:**
```
No file provided
```
# 📊 Level 7: File Sorting Script

**Mission:** Write a script that sorts all `.txt` files in a directory by their size, from smallest to largest, and displays the sorted list.

---

## Step 1: Give the files different sizes

Add different amounts of text to the `.txt` files in `Arena`, for example:

```bash
echo "Some text here" > warrior.txt
```
**Why:** The files need different sizes so the sort has something to show. `>` writes the text into the file.

## Step 2: Create the script in Vim

```bash
vim sort_files.sh
```

Press `i` to start typing, then add:

```bash
#!/bin/bash

echo "Text files sorted by size (smallest to largest):"
ls -lSr *.txt
```

**Why:**
- `*.txt` selects every file ending in `.txt`.
- `-S` sorts by size, largest first.
- `-r` reverses the order, so it's smallest first.
- `-l` shows the long format, including each file's size.
- `echo` prints a heading above the list.

Save and exit with `Esc` → `:wq` → `Enter`.

## Step 3: Make it executable

```bash
chmod +x sort_files.sh
```
**Why:** Gives the file permission to run as a program.

## Step 4: Run the script

```bash
./sort_files.sh
```
**Why:** `./` runs the script from the current folder.

## ✅ Output

```
Text files sorted by size (smallest to largest):
-rw-r--r--@ 1 farhanatasneem  staff   0 Nov 14 00:12 hero.txt
-rw-r--r--@ 1 farhanatasneem  staff  19 Nov 14 12:14 archer.txt
-rw-r--r--@ 1 farhanatasneem  staff  28 Nov 14 12:13 warrior.txt
-rwxr-xr-x@ 1 farhanatasneem  staff  39 Nov 14 11:30 scroll.txt
-rw-r--r--@ 1 farhanatasneem  staff  50 Nov 14 12:13 mage.txt
```

The size in bytes (the number before the date) goes up from 0 to 50, which confirms the files are sorted smallest to largest.

# 🔍 Level 8: Multi-File Searcher

**Mission:** Create a script that searches for a specific word or phrase across all `.log` files in a directory and outputs the names of the files that contain the word or phrase.

---

## Step 1: Create test log files

```bash
echo "The dragon attacked the village" > battle.log
echo "The knight found a dragon egg" > quest.log
echo "The camp was quiet tonight" > camp.log
```
**Why:** The script needs `.log` files to search. Two mention "dragon" and one doesn't, to check only the right files are listed.

## Step 2: Create the script in Vim

```bash
vim search_logs.sh
```

Press `i` to start typing, then add:

```bash
#!/bin/bash

if [ -z "$1" ]; then
  echo "No search word provided"
else
  echo "Files containing '$1':"
  grep -l "$1" *.log
fi
```

**Why:**
- `$1` holds the word or phrase typed after the script name.
- `-z "$1"` checks whether no search word was given.
- `grep` searches inside files for text.
- `-l` prints only the names of matching files, not the matching lines.
- `*.log` searches every file ending in `.log`.
- Quotes around `"$1"` allow searching for phrases with spaces.

Save and exit with `Esc` → `:wq` → `Enter`.

## Step 3: Make it executable

```bash
chmod +x search_logs.sh
```
**Why:** Gives the file permission to run as a program.

## Step 4: Search for a word

```bash
./search_logs.sh dragon
```

**Output:**
```
Files containing 'dragon':
battle.log
quest.log
```
`camp.log` isn't listed because it doesn't contain "dragon".

## Step 5: Search for a phrase

```bash
./search_logs.sh "dragon egg"
```
**Why:** Tests that phrases work too. Quotes keep the phrase together as one argument.

**Output:**
```
Files containing 'dragon egg':
quest.log
```

## Step 6: Run with no search word

```bash
./search_logs.sh
```
**Why:** Tests that the script handles a missing argument.

**Output:**
```
No search word provided
```
# 👀 Level 9: Script to Monitor Directory Changes

**Mission:** Write a script that monitors a directory for any changes (file creation, modification, or deletion) and logs the changes with a timestamp.

---

## How It Works

The script checks the folder every 2 seconds and compares it with the previous check:
- A file there **now** but not **before** → **CREATED**
- A file there **before** but not **now** → **DELETED**
- A file in both whose modified time or size changed → **MODIFIED**

## Step 1: Create the script in Vim

```bash
vim monitor.sh
```

Press `i` to start typing, then add:

```bash
#!/bin/bash

dir="${1:-.}"
log="$HOME/changes.log"

cd "$dir" || exit
echo "Monitoring $dir - press Ctrl + C to stop"

ls > /tmp/before.txt
stat -f "%N %m %z" * | sort > /tmp/before_stat.txt

while true
do
  sleep 2
  ls > /tmp/after.txt
  stat -f "%N %m %z" * | sort > /tmp/after_stat.txt
  time=$(date '+%Y-%m-%d %H:%M:%S')

  # Created: in the new list but not the old one
  for file in $(comm -13 /tmp/before.txt /tmp/after.txt); do
    echo "$time CREATED: $file" | tee -a "$log"
  done

  # Deleted: in the old list but not the new one
  for file in $(comm -23 /tmp/before.txt /tmp/after.txt); do
    echo "$time DELETED: $file" | tee -a "$log"
  done

  # Modified: details changed, and the file already existed
  for file in $(comm -13 /tmp/before_stat.txt /tmp/after_stat.txt | awk '{print $1}'); do
    if grep -qx "$file" /tmp/before.txt; then
      echo "$time MODIFIED: $file" | tee -a "$log"
    fi
  done

  mv /tmp/after.txt /tmp/before.txt
  mv /tmp/after_stat.txt /tmp/before_stat.txt
done
```

**Why:**
- `dir="${1:-.}"` watches the folder given as an argument, or the current folder if none is given.
- `log="$HOME/changes.log"` keeps the log outside the watched folder, so writing to it isn't counted as a change.
- `cd "$dir" || exit` moves into the folder, or stops if it doesn't exist.
- `ls` and `stat -f "%N %m %z"` save a snapshot of each file's name, modified time and size.
- `while true` with `sleep 2` repeats the check every 2 seconds until stopped.
- `date` creates the timestamp.
- `comm` compares the old and new snapshots to find created, deleted and modified files.
- `awk '{print $1}'` takes just the filename from each line.
- `grep -qx` checks the file existed before, so new files aren't also reported as modified.
- `tee -a` shows each change on screen and appends it to the log.
- `mv` makes the new snapshot the old one for the next check.

Save and exit with `Esc` → `:wq` → `Enter`.

## Step 2: Make it executable

```bash
chmod +x monitor.sh
```
**Why:** Gives the file permission to run as a program.

## Step 3: Start monitoring

```bash
./monitor.sh
```
**Why:** Starts the script watching the current folder. It keeps running until stopped.

## Step 4: Make changes in a second Terminal window

```bash
echo "New armour" >> warrior.txt
touch dragon.txt
rm dragon.txt
```
**Why:** The script is busy watching in the first window, so the changes are made from a second one to test all three types of change.

## ✅ Output

```
2026-11-14 12:43:13 MODIFIED: warrior.txt
2026-11-14 12:43:28 CREATED: dragon.txt
2026-11-14 12:43:32 DELETED: dragon.txt
```

## Step 5: Stop the script and check the log

Press **Ctrl + C** in the first window, then:

```bash
cat ~/changes.log
```
**Why:** Confirms the changes were saved to the log file, not just shown on screen.

# 🏆 Level 10: Boss Battle 2 - Intermediate Scripting

**Mission:** Write a script that:
1. Creates a directory called `Arena_Boss`
2. Creates 5 text files inside it, named `file1.txt` to `file5.txt`
3. Generates a random number of lines (between 10 and 20) in each file
4. Sorts these files by their size and displays the list
5. Checks if any of the files contain the word `Victory` and, if found, moves the file to a directory called `Victory_Archive`

---

## Step 1: Create the script in Vim

```bash
vim boss2.sh
```

Press `i` to start typing, then add:

```bash
#!/bin/bash

# 1. Create the directory
mkdir -p Arena_Boss

# 2 & 3. Create 5 files, each with 10-20 random lines
for i in {1..5}
do
  lines=$((RANDOM % 11 + 10))
  > Arena_Boss/file$i.txt

  for j in $(seq 1 $lines)
  do
    if [ $((RANDOM % 20)) -eq 0 ]; then
      echo "Victory" >> Arena_Boss/file$i.txt
    else
      echo "Battle line $j" >> Arena_Boss/file$i.txt
    fi
  done
done

# 4. Sort the files by size and display them
echo "Files sorted by size (smallest to largest):"
ls -lSr Arena_Boss/*.txt

# 5. Move any file containing 'Victory' to Victory_Archive
mkdir -p Victory_Archive
for file in Arena_Boss/*.txt
do
  if grep -q "Victory" "$file"; then
    mv "$file" Victory_Archive/
    echo "Victory found in $(basename "$file") - moved to Victory_Archive"
  fi
done
```

**Why:**
- `mkdir -p` creates the folders without an error if they already exist.
- `for i in {1..5}` loops 5 times, creating `file1.txt` to `file5.txt`.
- `$RANDOM` gives a random number. `% 11 + 10` keeps it between 10 and 20.
- `> file` empties the file first, so re-running doesn't pile on extra lines.
- `seq 1 $lines` is used because `{1..$lines}` doesn't work with variables.
- `RANDOM % 20 -eq 0` is true about 1 time in 20, so "Victory" appears randomly.
- `>>` adds each line to the end of the file.
- `ls -lSr` sorts the files by size, smallest first.
- `grep -q` checks for "Victory" without printing the match.
- `mv` moves matching files into `Victory_Archive`.
- `basename` shows just the filename in the message.

Save and exit with `Esc` → `:wq` → `Enter`.

## Step 2: Make it executable

```bash
chmod +x boss2.sh
```
**Why:** Gives the file permission to run as a program.

## Step 3: Run the script

```bash
./boss2.sh
```

**Output (files sorted by size):**
```
-rw-r--r--@ 1 farhanatasneem  staff  141 Nov 14 13:27 Arena_Boss/file5.txt
-rw-r--r--@ 1 farhanatasneem  staff  156 Nov 14 13:27 Arena_Boss/file1.txt
-rw-r--r--@ 1 farhanatasneem  staff  209 Nov 14 13:27 Arena_Boss/file4.txt
-rw-r--r--@ 1 farhanatasneem  staff  246 Nov 14 13:27 Arena_Boss/file2.txt
-rw-r--r--@ 1 farhanatasneem  staff  263 Nov 14 13:27 Arena_Boss/file3.txt
```

Because the lines are random, "Victory" doesn't appear on every run. This run had none, so the script was run again until it did.

## Step 4: Check the Victory files

```bash
grep "Victory" Victory_Archive/*.txt
```
**Why:** Confirms that only files containing "Victory" were moved.

**Output:**
```
Victory_Archive/file3.txt:Victory
Victory_Archive/file3.txt:Victory
Victory_Archive/file4.txt:Victory
```
`file3.txt` had "Victory" twice and `file4.txt` once, so both were moved to `Victory_Archive`.

# 💽 Level 11: Automated Disk Space Report

**Mission:** Create a script that checks the disk space usage of a specified directory and sends an alert if the usage exceeds a given threshold.

---

## Step 1: Create the script in Vim

```bash
vim disk_report.sh
```

Press `i` to start typing, then add:

```bash
#!/bin/bash

dir="$1"
threshold="$2"

# Check both arguments were given
if [ -z "$dir" ] || [ -z "$threshold" ]; then
  echo "Usage: ./disk_report.sh <directory> <threshold_in_KB>"
  exit 1
fi

# Check the directory exists
if [ ! -d "$dir" ]; then
  echo "Directory $dir not found"
  exit 1
fi

# Get the folder's size in KB
usage=$(du -sk "$dir" | awk '{print $1}')

echo "Disk usage of $dir: $usage KB (threshold: $threshold KB)"

# Compare against the threshold
if [ "$usage" -gt "$threshold" ]; then
  echo "ALERT: $dir is over the threshold!"
else
  echo "OK: $dir is within the limit."
fi
```

**Why:**
- `$1` and `$2` are the first and second arguments: the directory and the threshold.
- `||` means "or", so the script stops if either argument is missing.
- `exit 1` stops the script and signals an error.
- `! -d` checks that the directory **doesn't** exist.
- `du -sk` measures the folder's total size in kilobytes.
- `awk '{print $1}'` keeps just the number from the `du` output.
- `-gt` (greater than) compares the usage with the threshold.

Save and exit with `Esc` → `:wq` → `Enter`.

## Step 2: Make it executable

```bash
chmod +x disk_report.sh
```
**Why:** Gives the file permission to run as a program.

## Step 3: Check the folder's size

```bash
du -sk .
```
**Why:** Shows the current folder's size, to pick sensible thresholds for testing. `.` means the current folder.

**Output:**
```
88	.
```

## Step 4: Test with a low threshold

```bash
./disk_report.sh . 1
```
**Why:** 88 KB is over 1 KB, so this should trigger the alert.

**Output:**
```
Disk usage of .: 88 KB (threshold: 1 KB)
ALERT: . is over the threshold!
```

## Step 5: Test with a high threshold

```bash
./disk_report.sh . 100000
```
**Why:** 88 KB is under 100000 KB, so this should pass.

**Output:**
```
Disk usage of .: 88 KB (threshold: 100000 KB)
OK: . is within the limit.
```

## Step 6: Test with no arguments

```bash
./disk_report.sh
```
**Why:** Tests that the script handles missing arguments.

**Output:**
```
Usage: ./disk_report.sh <directory> <threshold_in_KB>
```

# ⚙️ Level 12: Simple Configuration File Parser

**Mission:** Write a script that reads a configuration file in the format `KEY=VALUE` and prints each key-value pair.

---

## Step 1: Create a config file

```bash
vim game.conf
```

Press `i` to start typing, then add:

```
# Game settings
PLAYER_NAME=Farhana
LEVEL=12
WEAPON=Sword

HEALTH=100
```

**Why:** The script needs a config file to read. The comment and blank line test that the script skips them, as real config files often have both.

Save and exit with `Esc` → `:wq` → `Enter`.

## Step 2: Create the script in Vim

```bash
vim parse_config.sh
```

Press `i` to start typing, then add:

```bash
#!/bin/bash

file="$1"

# Check a file was given
if [ -z "$file" ]; then
  echo "Usage: ./parse_config.sh <config_file>"
  exit 1
fi

# Check the file exists
if [ ! -f "$file" ]; then
  echo "File $file not found"
  exit 1
fi

# Read the file one line at a time
while IFS='=' read -r key value
do
  # Skip empty lines and comments
  if [ -z "$key" ] || [[ "$key" == \#* ]]; then
    continue
  fi

  echo "Key: $key, Value: $value"
done < "$file"
```

**Why:**
- `$1` is the config file passed as an argument.
- `-z` and `! -f` check that a file was given and that it exists.
- `while read ... done < "$file"` reads the file one line at a time.
- `IFS='='` splits each line at the `=` sign.
- `read -r key value` stores the two halves in `key` and `value`.
- `[[ "$key" == \#* ]]` checks whether the line starts with `#` (a comment).
- `continue` skips blank lines and comments.
- `echo` prints each key-value pair.

Save and exit with `Esc` → `:wq` → `Enter`.

## Step 3: Make it executable

```bash
chmod +x parse_config.sh
```
**Why:** Gives the file permission to run as a program.

## Step 4: Run the script

```bash
./parse_config.sh game.conf
```

## ✅ Output

```
Key: PLAYER_NAME, Value: Farhana
Key: LEVEL, Value: 12
Key: WEAPON, Value: Sword
Key: HEALTH, Value: 100
```

The comment and blank line were skipped.

## Step 5: Test the error checks

```bash
./parse_config.sh
./parse_config.sh missing.conf
```
**Why:** Tests that the script handles a missing argument and a file that doesn't exist.

**Output:**
```
Usage: ./parse_config.sh <config_file>
File missing.conf not found
```

# 🗄️ Level 13: Backup Script with Rotation

**Mission:** Create a script that backs up a directory to a specified location and keeps only the last 5 backups.

---

## Step 1: Create the script in Vim

```bash
vim backup_rotate.sh
```

Press `i` to start typing, then add:

```bash
#!/bin/bash

src="$1"
dest="$2"

# Check both arguments were given
if [ -z "$src" ] || [ -z "$dest" ]; then
  echo "Usage: ./backup_rotate.sh <directory_to_back_up> <backup_location>"
  exit 1
fi

# Check the source directory exists
if [ ! -d "$src" ]; then
  echo "Directory $src not found"
  exit 1
fi

# Create the backup location if it doesn't exist
mkdir -p "$dest"

# Create a backup with the date and time in its name
timestamp=$(date '+%Y%m%d_%H%M%S')
backup_file="$dest/backup_$timestamp.tar.gz"
tar -czf "$backup_file" "$src"
echo "Backup created: $backup_file"

# Keep only the 5 newest backups and delete the rest
ls -t "$dest"/backup_*.tar.gz | tail -n +6 | while read -r old
do
  rm "$old"
  echo "Deleted old backup: $old"
done
```

**Why:**
- `$1` and `$2` are the folder to back up and where to save the backups.
- The `if` checks make sure both arguments were given and the folder exists.
- `mkdir -p` creates the backup location if needed.
- `date` adds a timestamp so each backup has a unique name.
- `tar -czf` bundles and compresses the folder into one `.tar.gz` file.
- `ls -t` lists the backups newest first.
- `tail -n +6` skips the 5 newest, leaving only the older ones.
- `while read` and `rm` delete each old backup.

Save and exit with `Esc` → `:wq` → `Enter`.

## Step 2: Make it executable

```bash
chmod +x backup_rotate.sh
```
**Why:** Gives the file permission to run as a program.

## Step 3: Run a backup

```bash
./backup_rotate.sh . ~/arena_backups
```
**Why:** `.` backs up the current folder. Backups are saved outside it, in `~/arena_backups`, so they don't get included in each other.

## Step 4: Test the rotation

```bash
for i in {1..7}; do ./backup_rotate.sh . ~/arena_backups; sleep 1; done
```
**Why:** Runs the script 7 times to create more than 5 backups and check the oldest are deleted. `sleep 1` gives each backup a different timestamp.

## ✅ Output

```
Backup created: /Users/farhanatasneem/arena_backups/backup_20261114_145812.tar.gz
Backup created: /Users/farhanatasneem/arena_backups/backup_20261114_145813.tar.gz
Backup created: /Users/farhanatasneem/arena_backups/backup_20261114_145814.tar.gz
Backup created: /Users/farhanatasneem/arena_backups/backup_20261114_145815.tar.gz
Backup created: /Users/farhanatasneem/arena_backups/backup_20261114_145816.tar.gz
Deleted old backup: /Users/farhanatasneem/arena_backups/backup_20261114_145710.tar.gz
Backup created: /Users/farhanatasneem/arena_backups/backup_20261114_145817.tar.gz
Deleted old backup: /Users/farhanatasneem/arena_backups/backup_20261114_145812.tar.gz
Backup created: /Users/farhanatasneem/arena_backups/backup_20261114_145819.tar.gz
Deleted old backup: /Users/farhanatasneem/arena_backups/backup_20261114_145813.tar.gz
```

Once there were more than 5 backups, the oldest was deleted after each new one.

## Step 5: Check only 5 backups remain

```bash
ls ~/arena_backups
```

**Output:**
```
backup_20261114_145814.tar.gz
backup_20261114_145815.tar.gz
backup_20261114_145816.tar.gz
backup_20261114_145817.tar.gz
backup_20261114_145819.tar.gz
```
# 📋 Level 14: User-Friendly Menu Script

**Mission:** Create an interactive script that presents a menu with options for different system tasks (e.g. check disk space, show system uptime, list users) and executes the chosen task.

---

## Menu Options

| Option | Task | Command |
|--------|------|---------|
| 1 | Check disk space | `df -h /` |
| 2 | Show system uptime | `uptime` |
| 3 | List logged-in users | `who` |
| 4 | Show date and time | `date` |
| 5 | Show memory usage | `top -l 1 \| grep PhysMem` |
| 6 | Show top 5 processes by CPU | `ps -Ao pid,pcpu,comm -r \| head -6` |
| 7 | Show my IP address | `ipconfig getifaddr en0` |
| 8 | Exit | |

Options 1–3 are from the mission. Options 4–7 are extra tasks I added.

## Step 1: Create the script in Vim

```bash
vim menu.sh
```

Press `i` to start typing, then add:

```bash
#!/bin/bash

while true
do
  echo ""
  echo "===== System Menu ====="
  echo "1) Check disk space"
  echo "2) Show system uptime"
  echo "3) List logged-in users"
  echo "4) Show date and time"
  echo "5) Show memory usage"
  echo "6) Show top 5 processes by CPU"
  echo "7) Show my IP address"
  echo "8) Exit"
  echo "======================="

  read -p "Choose an option (1-8): " choice
  echo ""

  case $choice in
    1) df -h / ;;
    2) uptime ;;
    3) who ;;
    4) date ;;
    5) top -l 1 | grep PhysMem ;;
    6) ps -Ao pid,pcpu,comm -r | head -6 ;;
    7) ipconfig getifaddr en0 ;;
    8) echo "Goodbye!"; break ;;
    *) echo "Invalid option, please choose 1-8" ;;
  esac
done
```

**Why:**
- `while true` keeps showing the menu until the user chooses Exit.
- `read -p` asks the user to choose and saves their answer in `choice`.
- `case` runs a different command depending on the option chosen.
- `;;` ends each option, and `esac` ends the `case`.
- `break` leaves the loop to exit the script.
- `*)` catches anything that isn't 1–8.

**What each command does:**
- `df -h /` shows disk space in human-readable sizes.
- `uptime` shows how long the system has been running.
- `who` lists logged-in users.
- `date` shows the current date and time.
- `top -l 1 | grep PhysMem` shows memory usage from one snapshot of `top`.
- `ps -Ao pid,pcpu,comm -r | head -6` lists the top 5 processes by CPU use.
- `ipconfig getifaddr en0` shows the Wi-Fi IP address.

Save and exit with `Esc` → `:wq` → `Enter`.

## Step 2: Make it executable

```bash
chmod +x menu.sh
```
**Why:** Gives the file permission to run as a program.

## Step 3: Run the script

```bash
./menu.sh
```

**Output:**
```
===== System Menu =====
1) Check disk space
2) Show system uptime
3) List logged-in users
4) Show date and time
5) Show memory usage
6) Show top 5 processes by CPU
7) Show my IP address
8) Exit
=======================
Choose an option (1-8):
```

## Step 4: Test the options

- Each option 1–7 runs its task, and the menu then appears again.
- An invalid choice, e.g. `9`, shows:
  ```
  Invalid option, please choose 1-8
  ```
- Choosing `8` exits the script:
  ```
  Goodbye!
  ```

  # 👑 Level 15: Boss Battle 3 - Advanced Scripting

**Mission:** Write a script that presents a menu with the following options and executes the chosen task:
- Check disk space
- Show system uptime
- Back up the Arena directory and keep the last 3 backups
- Parse a configuration file `settings.conf` and display the values

This level combines the menu from Level 14, the backup rotation from Level 13 and the config parser from Level 12, using **functions** to keep the script organised.

---

## Step 1: Create the config file

```bash
vim settings.conf
```

Press `i` to start typing, then add:

```
# Arena settings
ARENA_NAME=Bash Battle Arena
MAX_PLAYERS=4
DIFFICULTY=Hard

BACKUP_LIMIT=3
```

**Why:** Option 4 needs a config file to read. The comment and blank line test that they're skipped.

Save and exit with `Esc` → `:wq` → `Enter`.

## Step 2: Create the script in Vim

```bash
vim boss3.sh
```

Press `i` to start typing, then add:

```bash
#!/bin/bash

# Always run from the folder this script is in (Arena)
cd "$(dirname "$0")" || exit

backup_dir="$HOME/arena_boss_backups"
config_file="settings.conf"

# ---------- Functions ----------

check_disk() {
  df -h /
}

show_uptime() {
  uptime
}

backup_arena() {
  mkdir -p "$backup_dir"
  timestamp=$(date '+%Y%m%d_%H%M%S')
  backup_file="$backup_dir/arena_$timestamp.tar.gz"
  tar -czf "$backup_file" .
  echo "Backup created: $backup_file"

  # Keep only the 3 newest backups
  ls -t "$backup_dir"/arena_*.tar.gz | tail -n +4 | while read -r old
  do
    rm "$old"
    echo "Deleted old backup: $old"
  done
}

parse_config() {
  if [ ! -f "$config_file" ]; then
    echo "$config_file not found"
    return
  fi

  while IFS='=' read -r key value
  do
    if [ -z "$key" ] || [[ "$key" == \#* ]]; then
      continue
    fi
    echo "Key: $key, Value: $value"
  done < "$config_file"
}

# ---------- Menu ----------

while true
do
  echo ""
  echo "===== Boss Battle 3 Menu ====="
  echo "1) Check disk space"
  echo "2) Show system uptime"
  echo "3) Backup Arena (keep last 3)"
  echo "4) Show settings.conf values"
  echo "5) Exit"
  echo "=============================="

  read -p "Choose an option (1-5): " choice
  echo ""

  case $choice in
    1) check_disk ;;
    2) show_uptime ;;
    3) backup_arena ;;
    4) parse_config ;;
    5) echo "Goodbye!"; break ;;
    *) echo "Invalid option, please choose 1-5" ;;
  esac
done
```

**Why:**
- `cd "$(dirname "$0")"` moves into the script's own folder, so it always backs up Arena wherever it's run from.
- Variables at the top (`backup_dir`, `config_file`) make the settings easy to change.
- **Functions** (`name() { ... }`) group each task into a named block, so the menu stays short.
- `backup_arena` reuses Level 13's logic. `tail -n +4` keeps the newest 3 backups.
- `parse_config` reuses Level 12's logic. `return` leaves the function early if the file is missing.
- `while true`, `read -p` and `case` build the menu, like Level 14.
- `break` exits the menu, and `*)` catches invalid choices.

Save and exit with `Esc` → `:wq` → `Enter`.

## Step 3: Make it executable

```bash
chmod +x boss3.sh
```
**Why:** Gives the file permission to run as a program.

## Step 4: Run the script

```bash
./boss3.sh
```

**Output:**
```
===== Boss Battle 3 Menu =====
1) Check disk space
2) Show system uptime
3) Backup Arena (keep last 3)
4) Show settings.conf values
5) Exit
==============================
Choose an option (1-5):
```

## Step 5: Test each option

**Options 1 and 2** show the disk space and system uptime.

**Option 3** was chosen 4 times. Each time a new backup was created, and on the 4th run the oldest was deleted, leaving 3.

**Option 4:**
```
Key: ARENA_NAME, Value: Bash Battle Arena
Key: MAX_PLAYERS, Value: 4
Key: DIFFICULTY, Value: Hard
Key: BACKUP_LIMIT, Value: 3
```

**Invalid choice (e.g. `9`):**
```
Invalid option, please choose 1-5
```

**Option 5:**
```
Goodbye!
```

## Step 6: Check only 3 backups remain

```bash
ls ~/arena_boss_backups
```
**Why:** Confirms the rotation kept only the 3 newest backups.


