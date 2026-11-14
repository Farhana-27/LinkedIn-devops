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
