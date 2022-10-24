#! /bin/sh

# cc -O3 -std=c11 -Wall -Wextra -Wno-unused-parameter -Wno-unused-function -pthread -c ggml.c -fPIC -lstdc++
# c++ -O3 -std=c++11 -Wall -Wextra -Wno-unused-parameter -Wno-unused-function -pthread -c whisper.cpp -fPIC -lstdc++
# c++ -O3 -std=c++11 -Wall -Wextra -Wno-unused-parameter -Wno-unused-function -pthread main.cpp whisper.o ggml.o --shared -o whisper.so -fPIC -lstdc++
# /home/hexaminate/Android/Sdk/ndk/24.0.8215888/toolchains/llvm/prebuilt/linux-x86_64/bin/clang -pthread -O3 -mavx -mavx2 -mfma -mf16c -c ./whisper.cpp/ggml.c -fPIC -lstdc++
# /home/hexaminate/Android/Sdk/ndk/24.0.8215888/toolchains/llvm/prebuilt/linux-x86_64/bin/clang -pthread -O3 -mavx -mavx2 -mfma -mf16c -c ./whisper.cpp/whisper.cpp -fPIC -lstdc++

#/home/hexaminate/Android/Sdk/ndk/24.0.8215888/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ -pthread -O3 -std=c++11 -c ./galaxeus_ai.cpp -fPIC -lstdc++ 
#/home/hexaminate/Android/Sdk/ndk/24.0.8215888/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ -pthread -o ./galaxeus_android.so ./whisper.cpp/whisper.o ./whisper.cpp/ggml.o ./galaxeus_ai.o --shared -fPIC -lstdc++ -ldl -lm

/home/hexaminate/Android/Sdk/ndk/24.0.8215888/toolchains/llvm/prebuilt/linux-x86_64/bin/clang --target=aarch64-linux-android21 --gcc-toolchain=/home/hexaminate/Android/Sdk/ndk/24.0.8215888/toolchains/llvm/prebuilt/linux-x86_64 --sysroot=/home/hexaminate/Android/Sdk/ndk/24.0.8215888/toolchains/llvm/prebuilt/linux-x86_64/sysroot -pthread -O3 -std=c11 -mavx -mavx2 -mfma -mf16c -c ./whisper.cpp/ggml.c -fPIC -lstdc++ -static-libstdc++
/home/hexaminate/Android/Sdk/ndk/24.0.8215888/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=aarch64-linux-android21 --gcc-toolchain=/home/hexaminate/Android/Sdk/ndk/24.0.8215888/toolchains/llvm/prebuilt/linux-x86_64 --sysroot=/home/hexaminate/Android/Sdk/ndk/24.0.8215888/toolchains/llvm/prebuilt/linux-x86_64/sysroot -pthread -O3 -std=c++11 -mavx -mavx2 -mfma -mf16c -c ./whisper.cpp/whisper.cpp -fPIC -lstdc++ -static-libstdc++
/home/hexaminate/Android/Sdk/ndk/24.0.8215888/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=aarch64-linux-android21 --gcc-toolchain=/home/hexaminate/Android/Sdk/ndk/24.0.8215888/toolchains/llvm/prebuilt/linux-x86_64 --sysroot=/home/hexaminate/Android/Sdk/ndk/24.0.8215888/toolchains/llvm/prebuilt/linux-x86_64/sysroot -pthread -O3 -std=c++11 ./galaxeus_ai.cpp -fPIC -lstdc++ whisper.o ggml.o -o ./galaxeus_ai.so --shared -fPIC -lstdc++ -ldl -lm -static-libstdc++
