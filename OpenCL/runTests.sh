MY_PWD=$(pwd)
for currTestExe in **/*.exe
do
	BASENAME=$(basename $currTestExe .exe)
    DIRNAME=$(dirname $currTestExe)
    cd $DIRNAME

	TEST_OUT=$(./$BASENAME.exe 2> /dev/null)

    FAIL=$(printf "%s" "$TEST_OUT" | grep 'Non-Matching' | grep -oE '[0-9]+$')
    if [[ -z "$FAIL" || "$FAIL" -ne 0 ]]; then
        echo -e "\033[31m$BASENAME: FAIL\033[0m"
    else
        echo -e "\033[32m$BASENAME: PASS\033[0m"
    fi

    cd $MY_PWD
done
