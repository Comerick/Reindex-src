folder=src
pattern='-name "*.entity.ts"-o -name "*.dto.ts"-o -name "*.guard.ts"-o -name "*.strategy.ts"-o -type f -wholename "**/common/*.ts"'
read -p "Specify path to folder: " folder
#todo specify pattern

folder=$1 || $folder

for x in $(find $folder/**/** pattern 2>/dev/null)
do

    fileBase=$(basename $x)
    fileImportName=${fileBase%.ts}
     rm $(echo "$x" | sed -e "s/${fileBase}/index.ts/g") 2>/dev/null

done

for x in $(find $folder/**/** pattern 2>/dev/null)
do
    echo $x
    fileBase=$(basename $x)
    fileImportName=${fileBase%.ts}

    echo "\nAppend to index file... $fileBase"


    echo "export * from './${fileImportName}';" >> $(echo "$x" | sed -e "s/${fileBase}/index.ts/g")
done
