all: prepare

install:
	sudo cmake --build build --target install

prepare:
	rm -rf build
	mkdir build

conan_d:
	rm -rf build
	mkdir build
	cd build && conan install .. -s build_type=Debug --output-folder=. --build missing -s compiler.cppstd=17

conan_r:
	rm -rf build
	mkdir build
	cd build && conan install .. -s build_type=Release --output-folder=. --build missing -s compiler.cppstd=17

dependency:
	cd build && cmake .. --graphviz=dependencies.dot && dot -Tpng dependencies.dot -o dependencies.png
