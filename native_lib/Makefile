gcc="clang"
gpp="clang++"

main: 
	gcc -pthread -O3 -mavx -mavx2 -mfma -mf16c -c ./whisper.cpp/ggml.c -fPIC
	gcc -pthread -O3 -mavx -mavx2 -mfma -mf16c -c ./whisper.cpp/whisper.cpp -fPIC
	g++ -pthread -O3 -std=c++11 -c ./galaxeus_ai.cpp -fPIC
	g++ -pthread ./whisper.o ./ggml.o ./galaxeus_ai.o --shared -fPIC -static-libstdc++ -o ./galaxeus_ai.so

install:
	sudo cp *.so /usr/lib/
	
gcc="/home/hexaminate/Android/Sdk/ndk/24.0.8215888/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android21-clang"
gpp="/home/hexaminate/Android/Sdk/ndk/24.0.8215888/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android21-clang++"
compile.android: 
	$(gcc) -O3 -std=c11 -pthread -fPIC -c ./whisper.cpp/ggml.c
	$(gpp) -O3 -std=c++11 -pthread -fPIC -c ./whisper.cpp/whisper.cpp
	$(gpp) -O3 -std=c++11 -pthread -fPIC -c ./galaxeus_ai.cpp
	$(gpp) ./whisper.o ./ggml.o ./galaxeus_ai.o --shared -static-libstdc++ -fPIC  -o ./galaxeus_ai.so 

# clean up the directory
clean:
	rm -f *.o main *.so