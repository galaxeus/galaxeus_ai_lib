library galaxeus_ai_dart;

// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:ffmpeg_dart/ffmpeg_dart.dart';
import 'package:universal_io/io.dart';
import 'package:galaxeus_lib/galaxeus_lib.dart';

import 'package:ffi/ffi.dart';
part 'src/scheme/galaxeus_ai_native_response.dart';
part 'src/scheme/galaxeus_ai_native_request.dart';

part 'src/type_data/chatbot.dart';
part 'src/scheme/galaxeus_ai_memory.dart';
part 'src/scheme/galaxeus_ai/galaxeus_ai_person.dart';
part 'src/scheme/galaxeus_ai_response.dart';
part 'src/scheme/galaxeus_ai_request.dart';
part 'src/galaxeus_ai.dart';
part 'src/audio/convert.dart';
part 'src/extension/ffmpeg.dart';
part 'src/galaxeus_ai_native.dart';
part 'src/utils/utils.dart';
