for lib in `ldd $1 | sed -r 's/\s*[^=]*=> (\S+) \(.*/\1/g'`
do
    if [ -f $lib ]
    then
        cp -v $lib .
    fi
done
