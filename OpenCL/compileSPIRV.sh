# Compiles all **/*.cl files to SPIR-V using ClangIR pipeline

if [ ! -z "$1" ]
then
	CLANGIR_PATH=$1
fi

# if CLANGIR_PATH is not set, set it to the default path
if [ -z "$CLANGIR_PATH" ]
then
	CLANGIR_PATH=clang
fi

# assert CLANG_PATH is an executable
if [ ! -x "$CLANGIR_PATH" ]
then
	echo "Error: CLANGIR_PATH is not set to a valid executable"
	exit 1
fi

# compile all OpenCL codes using ClangIR pipeline to emit a .spv file
# glob **/*.cl now
for currClSrc in **/*.cl
do
	echo $currClSrc
	BASENAME=$(basename $currClSrc .cl)
    DIRNAME=$(dirname $currClSrc)
	$CLANGIR_PATH -fclangir --target=spirv64 $currClSrc -o $DIRNAME/$BASENAME.spv
done
