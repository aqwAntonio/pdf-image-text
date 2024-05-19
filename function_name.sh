mime=$(file -b --mime-type $1)
if [[ $mime == "image/"* ]]
then
    echo $1
    echo "$1" >> file.txt
    tesseract $1 "$1.txt" -l rus
fi
exit
if [[ $mime == *"/pdf" ]]
then
    echo $1
    echo "$1" >> file.txt

    first=$1
    second="arr3"
    first=${first/arr/$second}
    file_folder=$(dirname $first)
    mkdir -p $file_folder

    echo $first

    pdftoppm $1 $first -png
fi