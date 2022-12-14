#define MINIAUDIO_IMPLEMENTATION
#include "miniaudio.h"
#include <stdio.h>

void play()
{
    ma_result result;
    ma_engine engine;

    result = ma_engine_init(NULL, &engine);
    if (result != MA_SUCCESS)
    {
        printf("Failed to initialize audio engine.");
        exit(1);
    }

    ma_sound sound;
    result = ma_sound_init_from_file(&engine, "/home/hexaminate/Documents/HEXAMINATE/app/ai/galaxeus_ai/native_lib/samples/jfk.wav", 0, NULL, NULL, &sound);
    if (result != MA_SUCCESS)
    {
        printf("Failed to load sound file.");
        exit(1);
    }
    ma_sound_start(&sound);
    while (true)
    {
        if (ma_sound_at_end(&sound) != 0)
        {

            ma_sound_stop(&sound);
            ma_engine_uninit(&engine);
            return;
        }
    }
    ma_sound_stop(&sound);
    ma_engine_uninit(&engine);
    return;
}

int main()
{
    play();
    // play("./block.mp3");
    return 0;
}