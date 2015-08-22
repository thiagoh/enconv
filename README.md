# enconv.sh file encoding converter
File encoding converter for unix environments

## Install
```
cd <install-dir>
git clone https://github.com/thiagoh/enconv
cd enconv
chmod +x enconv.sh
sudo ln -s <install-dir>/enconv/enconv.sh /usr/local/bin/enconv
```

##Usage
```
# to convert all .java files from iso-8859-1 to utf-8 run
enconv -d /home/foo/example/directory -e ".java" -f "iso-8859-1" -t "utf-8"

# to convert all .txt files from us-ascii to utf-8 run
enconv -d /home/foo/example/directory -e ".txt" -f "us-ascii" -t "utf-8"

# to convert all RECURSIVELY .txt files from us-ascii to utf-8 run
enconv -r -d /home/foo/example/directory -e ".txt" -f "us-ascii" -t "utf-8"
```
