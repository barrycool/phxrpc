
set -e  # exit immediately on error
set -x  # display all commands

mkdir -p third_party

cd third_party;

if [ ! -f protobuf/bin/protoc ]; then
	if [ ! -f protobuf-cpp-3.9.1.tar.gz ]; then
		wget https://github.com/google/protobuf/releases/download/v3.9.1/protobuf-cpp-3.9.1.tar.gz
	fi	

	tar zxvf protobuf-cpp-3.9.1.tar.gz
	cd protobuf-3.9.1

	./configure --prefix=`pwd`/../protobuf
	make -j2
	make install

	cd ../
fi

cd ..

make

exit $?
