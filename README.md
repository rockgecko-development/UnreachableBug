# unreachable_bug

minimum reproducible code for a 'uncreachable code' crash on iOS.

## Getting Started

This project is a minimum reproduceable code for a `uncreachable code` crash on iOS.

When run in debug mode on an iPhone 6, iOS 12, it crashes after about 10 seconds, the output is:
```
../../third_party/dart/runtime/vm/compiler/backend/il_dbc.cc: 151: error: unreachable code
version=2.3.0-dev.0.5.flutter-a1668566e5 (Tue Apr 30 20:35:41 2019 +0200) on "ios_dbc"
thread=35415, isolate=main(0x108837000)
  pc 0x00000001016c3420 fp 0x000000016f9d8c30 dart::Profiler::DumpStackTrace(void*)
  pc 0x0000000000000001 fp 0x000000016f9d8ea0 Unknown symbol
  pc 0x0000000000000000 fp 0x000000016f9d9c18 Unknown symbol

-- End of DumpStackTrace
Lost connection to device.
Exited (sigterm)

```

It works fine in release mode, and on the simulator, and on Android.
Changing any of the steps in the timer function cause it to no longer crash (eg, eliminating the `scratchArray` and using `event` in the magnitude calculation directly, eliminating the magnitude calculation, or removing the `NumberFormat` call). The're all necessary.
It still crashes if the timer interval is increased to 50ms, it just takes a bit longer to crash.

Rest of my configuration:
Channel stable, v1.5.4-hotfix.2, on Mac OS X 10.14.4 18E227, locale en-AU)
Xcode 10.2.1