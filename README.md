# enconv.sh File Converter
File encoding converter for file 

##Usage
```
chmod +x enconv.sh

# to convert all .java files from iso-8859-1 to utf-8 run
./enconv.sh -d /home/foo/example/directory -e ".java" -f "iso-8859-1" -t "utf-8"

# to convert all .txt files from us-ascii to utf-8 run
./enconv.sh -d /home/foo/example/directory -e ".txt" -f "us-ascii" -t "utf-8"

# to convert all RECURSIVELY .txt files from us-ascii to utf-8 run
./enconv.sh -r -d /home/foo/example/directory -e ".txt" -f "us-ascii" -t "utf-8"

```
