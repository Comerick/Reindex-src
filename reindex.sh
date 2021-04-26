folderDefault=src
patternDefault='-name "*.entity.ts" -o -name "*.dto.ts" -o -name "*.guard.ts" -o -name "*.strategy.ts" -o -type f -wholename "**/common/*.ts"'


if !(${silent})
then
    echo "Default folder: $folderDefault"
    read -p "Specify path to folder(optional): " folder

    echo "Default pattern: $patternDefault"
    read -p "Specify pattern(optional): " pattern
fi

folder=${folder:-$1 || $folderDefault}
pattern=${pattern:-$2 || $patternDefault}


for x in $(find $folder/**/** pattern 2>/dev/null)
do

    fileBase=$(basename $x)
    fileImportName=${fileBase%.ts}
    rm $(echo "$x" | sed -e "s/${fileBase}/index.ts/g") 2>/dev/null

done

for x in $(find $folder/**/** pattern 2>/dev/null)
do
    fileBase=$(basename $x)
    fileImportName=${fileBase%.ts}

    echo "Append to index file... $fileBase"


    echo "export * from './${fileImportName}';" >> $(echo "$x" | sed -e "s/${fileBase}/index.ts/g")
done

npm run lint 2>/dev/null
npm run format 2>/dev/null