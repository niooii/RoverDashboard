// ignore_for_file: directives_ordering

/// The data library.
///
/// This library defines any data types needed by the rest of the app. While the dataclasses may
/// have methods, the logic within should be simple, and any broad logic that changes state should
/// happen in the models library.
///
/// This library should be the bottom of the dependency graph, meaning that no file included in this
///  library should import any other library.
library data;

export "src/data/generated/arm.pb.dart";
export "src/data/generated/core.pb.dart";
export "src/data/generated/coordinates.pb.dart";
export "src/data/generated/drive.pb.dart";
export "src/data/generated/electrical.pb.dart";
export "src/data/generated/gps.pb.dart";
export "src/data/generated/science.pb.dart";
export "src/data/generated/video.pb.dart";
export "src/data/generated/wrapper.pb.dart";

export "src/data/generated/google/protobuf/timestamp.pb.dart";

export "src/data/metrics/drive.dart";
export "src/data/metrics/position.dart";
export "src/data/metrics/electrical.dart";
export "src/data/metrics/metrics.dart";
export "src/data/metrics/science.dart";

export "src/data/constants.dart";
export "src/data/modes.dart";
export "src/data/protobuf.dart";
export "src/data/science.dart";
export "src/data/settings.dart";
export "src/data/socket.dart";
export "src/data/taskbar_message.dart";
