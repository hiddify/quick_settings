// Autogenerated from Pigeon (v10.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

/// Status of a Tile
enum TileStatus {
  /// The Tile is considered to be active.
  ///
  /// Example: the alarm is activated
  active,

  /// The Tile is considered to be inactive.
  ///
  /// Example: the alarm is not activated
  inactive,

  /// Tile is unavailable and can't be clicked.
  ///
  /// Example: the alarm has not been scheduled so it can't be activated.
  unavailable,
}

/// Object representing a Quick Settings tile with all its possible fields
class Tile {
  Tile({
    required this.label,
    required this.tileStatus,
    this.contentDescription,
    this.stateDescription,
    this.drawableName,
    this.subtitle,
  });

  /// Main text associated with the Tile
  String label;

  /// Wether this tile is active, inactive or unavailable
  TileStatus tileStatus;

  /// Content description for the Tile
  String? contentDescription;

  /// State description for the Tile
  String? stateDescription;

  /// Native Android drawable name.
  ///
  /// This icon is expected to be white on alpha, and may be tinted by the system to match it's theme.
  String? drawableName;

  /// Subtitle for the tile, null below Android 10.
  ///
  /// It might be visible to the user when the Quick Settings panel is fully open.
  String? subtitle;

  Object encode() {
    return <Object?>[
      label,
      tileStatus.index,
      contentDescription,
      stateDescription,
      drawableName,
      subtitle,
    ];
  }

  static Tile decode(Object result) {
    result as List<Object?>;
    return Tile(
      label: result[0]! as String,
      tileStatus: TileStatus.values[result[1]! as int],
      contentDescription: result[2] as String?,
      stateDescription: result[3] as String?,
      drawableName: result[4] as String?,
      subtitle: result[5] as String?,
    );
  }
}

/// Result when asking to add a tile
class AddTileResult {
  AddTileResult({
    required this.success,
    this.errorDescription,
  });

  /// [success] will be false when quick_settings can't find your drawable.
  /// Otherwise, it will be true. A limitation from the native side doesn't
  /// let us provide a "denied" state when asking to add the Tile.
  bool success;

  /// Description of the error. It will used only to explain with drawable has
  /// not been found for now.
  String? errorDescription;

  Object encode() {
    return <Object?>[
      success,
      errorDescription,
    ];
  }

  static AddTileResult decode(Object result) {
    result as List<Object?>;
    return AddTileResult(
      success: result[0]! as bool,
      errorDescription: result[1] as String?,
    );
  }
}

class _QuickSettingsInterfaceCodec extends StandardMessageCodec {
  const _QuickSettingsInterfaceCodec();

  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is AddTileResult) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return AddTileResult.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class QuickSettingsInterface {
  /// Constructor for [QuickSettingsInterface].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  QuickSettingsInterface({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _QuickSettingsInterfaceCodec();

  Future<AddTileResult> addTileToQuickSettings(
      String arg_title, String arg_drawableName) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.QuickSettingsInterface.addTileToQuickSettings',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_title, arg_drawableName]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as AddTileResult?)!;
    }
  }

  Future<void> enableTile() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.QuickSettingsInterface.enableTile', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> disableTile() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.QuickSettingsInterface.disableTile', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> startBackgroundIsolate(
      int arg_pluginCallbackHandle,
      int? arg_onStatusChangedHandle,
      int? arg_onTileAddedHandle,
      int? arg_onTileRemovedHandle) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.QuickSettingsInterface.startBackgroundIsolate',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(<Object?>[
      arg_pluginCallbackHandle,
      arg_onStatusChangedHandle,
      arg_onTileAddedHandle,
      arg_onTileRemovedHandle
    ]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }
}

class QuickSettingsBackgroundInterface {
  /// Constructor for [QuickSettingsBackgroundInterface].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  QuickSettingsBackgroundInterface({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = StandardMessageCodec();

  Future<void> onInitialized() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.QuickSettingsBackgroundInterface.onInitialized',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }
}

class _QuickSettingsBackgroundToDartCodec extends StandardMessageCodec {
  const _QuickSettingsBackgroundToDartCodec();

  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is Tile) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is Tile) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return Tile.decode(readValue(buffer)!);
      case 129:
        return Tile.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

abstract class QuickSettingsBackgroundToDart {
  static const MessageCodec<Object?> codec =
      _QuickSettingsBackgroundToDartCodec();

  Tile? onTileClicked(int userCallbackHandle, Tile tile);

  Tile? onTileAdded(int callbackHandle, Tile tile);

  void onTileRemoved(int callbackHandle);

  static void setup(QuickSettingsBackgroundToDart? api,
      {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.QuickSettingsBackgroundToDart.onTileClicked',
          codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.QuickSettingsBackgroundToDart.onTileClicked was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_userCallbackHandle = (args[0] as int?);
          assert(arg_userCallbackHandle != null,
              'Argument for dev.flutter.pigeon.QuickSettingsBackgroundToDart.onTileClicked was null, expected non-null int.');
          final Tile? arg_tile = (args[1] as Tile?);
          assert(arg_tile != null,
              'Argument for dev.flutter.pigeon.QuickSettingsBackgroundToDart.onTileClicked was null, expected non-null Tile.');
          final Tile? output =
              api.onTileClicked(arg_userCallbackHandle!, arg_tile!);
          return output;
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.QuickSettingsBackgroundToDart.onTileAdded', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.QuickSettingsBackgroundToDart.onTileAdded was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_callbackHandle = (args[0] as int?);
          assert(arg_callbackHandle != null,
              'Argument for dev.flutter.pigeon.QuickSettingsBackgroundToDart.onTileAdded was null, expected non-null int.');
          final Tile? arg_tile = (args[1] as Tile?);
          assert(arg_tile != null,
              'Argument for dev.flutter.pigeon.QuickSettingsBackgroundToDart.onTileAdded was null, expected non-null Tile.');
          final Tile? output = api.onTileAdded(arg_callbackHandle!, arg_tile!);
          return output;
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.QuickSettingsBackgroundToDart.onTileRemoved',
          codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.QuickSettingsBackgroundToDart.onTileRemoved was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_callbackHandle = (args[0] as int?);
          assert(arg_callbackHandle != null,
              'Argument for dev.flutter.pigeon.QuickSettingsBackgroundToDart.onTileRemoved was null, expected non-null int.');
          api.onTileRemoved(arg_callbackHandle!);
          return;
        });
      }
    }
  }
}
