#!/bin/sh

cd "$(dirname "$(readlink -f "$(command -v "$0")")")"
if [ -d "venv/" ] && [ ! "x$(command -v python)" == "x$VIRTUAL_ENV/bin/python" ]; then
	source ./venv/bin/activate
	echo "Using virtualenv"
fi

# any compiled file whatsoever

find . -type f \( \
	-name '*.py[cod]' -o -name '*.slo' -o -name '*.lo' -o -name '*.o' \
	-o -name '*.so' -o -name '*.dylib' -o -name '*.lai' -o -name '*.la' \
	-o -name '*.a' \) \
	-not -path "./venv/*" \
	-not -path "./build/*" \

# cython autogenerated

rm -f pyspades/common.cpp
rm -f pyspades/vxl.cpp

# native binaries directories

rm -rf build/

python2 build.py build_ext -f --inplace
