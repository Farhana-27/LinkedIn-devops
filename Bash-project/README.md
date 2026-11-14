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


