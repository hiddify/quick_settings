// Autogenerated from Pigeon (v10.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package io.apparence.quick_settings.pigeon

import android.util.Log
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MessageCodec
import io.flutter.plugin.common.StandardMessageCodec
import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer

private fun wrapResult(result: Any?): List<Any?> {
    return listOf(result)
}

private fun wrapError(exception: Throwable): List<Any?> {
    if (exception is FlutterError) {
        return listOf(
            exception.code,
            exception.message,
            exception.details
        )
    } else {
        return listOf(
            exception.javaClass.simpleName,
            exception.toString(),
            "Cause: " + exception.cause + ", Stacktrace: " + Log.getStackTraceString(exception)
        )
    }
}

/**
 * Error class for passing custom error details to Flutter via a thrown PlatformException.
 * @property code The error code.
 * @property message The error message.
 * @property details The error details. Must be a datatype supported by the api codec.
 */
class FlutterError(
    val code: String,
    override val message: String? = null,
    val details: Any? = null
) : Throwable()

/** Status of a Tile */
enum class TileStatus(val raw: Int) {
    /**
     * The Tile is considered to be active.
     *
     * Example: the alarm is activated
     */
    ACTIVE(0),

    /**
     * The Tile is considered to be inactive.
     *
     * Example: the alarm is not activated
     */
    INACTIVE(1),

    /**
     * Tile is unavailable and can't be clicked.
     *
     * Example: the alarm has not been scheduled so it can't be activated.
     */
    UNAVAILABLE(2);

    companion object {
        fun ofRaw(raw: Int): TileStatus? {
            return values().firstOrNull { it.raw == raw }
        }
    }
}

/**
 * Object representing a Quick Settings tile with all its possible fields
 *
 * Generated class from Pigeon that represents data sent in messages.
 */
data class Tile(
    /** Main text associated with the Tile */
    val label: String,
    /** Wether this tile is active, inactive or unavailable */
    val tileStatus: TileStatus,
    /** Content description for the Tile */
    val contentDescription: String? = null,
    /** State description for the Tile */
    val stateDescription: String? = null,
    /**
     * Native Android drawable name.
     *
     * This icon is expected to be white on alpha, and may be tinted by the system to match it's theme.
     */
    val drawableName: String? = null,
    /**
     * Subtitle for the tile, null below Android 10.
     *
     * It might be visible to the user when the Quick Settings panel is fully open.
     */
    val subtitle: String? = null

) {
    companion object {
        @Suppress("UNCHECKED_CAST")
        fun fromList(list: List<Any?>): Tile {
            val label = list[0] as String
            val tileStatus = TileStatus.ofRaw(list[1] as Int)!!
            val contentDescription = list[2] as String?
            val stateDescription = list[3] as String?
            val drawableName = list[4] as String?
            val subtitle = list[5] as String?
            return Tile(
                label,
                tileStatus,
                contentDescription,
                stateDescription,
                drawableName,
                subtitle
            )
        }
    }

    fun toList(): List<Any?> {
        return listOf<Any?>(
            label,
            tileStatus.raw,
            contentDescription,
            stateDescription,
            drawableName,
            subtitle,
        )
    }
}

/**
 * Result when asking to add a tile
 *
 * Generated class from Pigeon that represents data sent in messages.
 */
data class AddTileResult(
    /**
     * [success] will be false when quick_settings can't find your drawable.
     * Otherwise, it will be true. A limitation from the native side doesn't
     * let us provide a "denied" state when asking to add the Tile.
     */
    val success: Boolean,
    /**
     * Description of the error. It will used only to explain with drawable has
     * not been found for now.
     */
    val errorDescription: String? = null

) {
    companion object {
        @Suppress("UNCHECKED_CAST")
        fun fromList(list: List<Any?>): AddTileResult {
            val success = list[0] as Boolean
            val errorDescription = list[1] as String?
            return AddTileResult(success, errorDescription)
        }
    }

    fun toList(): List<Any?> {
        return listOf<Any?>(
            success,
            errorDescription,
        )
    }
}

@Suppress("UNCHECKED_CAST")
private object QuickSettingsInterfaceCodec : StandardMessageCodec() {
    override fun readValueOfType(type: Byte, buffer: ByteBuffer): Any? {
        return when (type) {
            128.toByte() -> {
                return (readValue(buffer) as? List<Any?>)?.let {
                    AddTileResult.fromList(it)
                }
            }

            else -> super.readValueOfType(type, buffer)
        }
    }

    override fun writeValue(stream: ByteArrayOutputStream, value: Any?) {
        when (value) {
            is AddTileResult -> {
                stream.write(128)
                writeValue(stream, value.toList())
            }

            else -> super.writeValue(stream, value)
        }
    }
}

/** Generated interface from Pigeon that represents a handler of messages from Flutter. */
interface QuickSettingsInterface {
    fun addTileToQuickSettings(
        title: String,
        drawableName: String,
        callback: (Result<AddTileResult>) -> Unit
    )

    fun enableTile()
    fun disableTile()
    fun startBackgroundIsolate(
        pluginCallbackHandle: Long,
        onStatusChangedHandle: Long?,
        onTileAddedHandle: Long?,
        onTileRemovedHandle: Long?
    )

    companion object {
        /** The codec used by QuickSettingsInterface. */
        val codec: MessageCodec<Any?> by lazy {
            QuickSettingsInterfaceCodec
        }

        /** Sets up an instance of `QuickSettingsInterface` to handle messages through the `binaryMessenger`. */
        @Suppress("UNCHECKED_CAST")
        fun setUp(binaryMessenger: BinaryMessenger, api: QuickSettingsInterface?) {
            run {
                val channel = BasicMessageChannel<Any?>(
                    binaryMessenger,
                    "dev.flutter.pigeon.QuickSettingsInterface.addTileToQuickSettings",
                    codec
                )
                if (api != null) {
                    channel.setMessageHandler { message, reply ->
                        val args = message as List<Any?>
                        val titleArg = args[0] as String
                        val drawableNameArg = args[1] as String
                        api.addTileToQuickSettings(
                            titleArg,
                            drawableNameArg
                        ) { result: Result<AddTileResult> ->
                            val error = result.exceptionOrNull()
                            if (error != null) {
                                reply.reply(wrapError(error))
                            } else {
                                val data = result.getOrNull()
                                reply.reply(wrapResult(data))
                            }
                        }
                    }
                } else {
                    channel.setMessageHandler(null)
                }
            }
            run {
                val channel = BasicMessageChannel<Any?>(
                    binaryMessenger,
                    "dev.flutter.pigeon.QuickSettingsInterface.enableTile",
                    codec
                )
                if (api != null) {
                    channel.setMessageHandler { _, reply ->
                        var wrapped: List<Any?>
                        try {
                            api.enableTile()
                            wrapped = listOf<Any?>(null)
                        } catch (exception: Throwable) {
                            wrapped = wrapError(exception)
                        }
                        reply.reply(wrapped)
                    }
                } else {
                    channel.setMessageHandler(null)
                }
            }
            run {
                val channel = BasicMessageChannel<Any?>(
                    binaryMessenger,
                    "dev.flutter.pigeon.QuickSettingsInterface.disableTile",
                    codec
                )
                if (api != null) {
                    channel.setMessageHandler { _, reply ->
                        var wrapped: List<Any?>
                        try {
                            api.disableTile()
                            wrapped = listOf<Any?>(null)
                        } catch (exception: Throwable) {
                            wrapped = wrapError(exception)
                        }
                        reply.reply(wrapped)
                    }
                } else {
                    channel.setMessageHandler(null)
                }
            }
            run {
                val channel = BasicMessageChannel<Any?>(
                    binaryMessenger,
                    "dev.flutter.pigeon.QuickSettingsInterface.startBackgroundIsolate",
                    codec
                )
                if (api != null) {
                    channel.setMessageHandler { message, reply ->
                        val args = message as List<Any?>
                        val pluginCallbackHandleArg =
                            args[0].let { if (it is Int) it.toLong() else it as Long }
                        val onStatusChangedHandleArg =
                            args[1].let { if (it is Int) it.toLong() else it as Long? }
                        val onTileAddedHandleArg =
                            args[2].let { if (it is Int) it.toLong() else it as Long? }
                        val onTileRemovedHandleArg =
                            args[3].let { if (it is Int) it.toLong() else it as Long? }
                        var wrapped: List<Any?>
                        try {
                            api.startBackgroundIsolate(
                                pluginCallbackHandleArg,
                                onStatusChangedHandleArg,
                                onTileAddedHandleArg,
                                onTileRemovedHandleArg
                            )
                            wrapped = listOf<Any?>(null)
                        } catch (exception: Throwable) {
                            wrapped = wrapError(exception)
                        }
                        reply.reply(wrapped)
                    }
                } else {
                    channel.setMessageHandler(null)
                }
            }
        }
    }
}

/** Generated interface from Pigeon that represents a handler of messages from Flutter. */
interface QuickSettingsBackgroundInterface {
    fun onInitialized()

    companion object {
        /** The codec used by QuickSettingsBackgroundInterface. */
        val codec: MessageCodec<Any?> by lazy {
            StandardMessageCodec()
        }

        /** Sets up an instance of `QuickSettingsBackgroundInterface` to handle messages through the `binaryMessenger`. */
        @Suppress("UNCHECKED_CAST")
        fun setUp(binaryMessenger: BinaryMessenger, api: QuickSettingsBackgroundInterface?) {
            run {
                val channel = BasicMessageChannel<Any?>(
                    binaryMessenger,
                    "dev.flutter.pigeon.QuickSettingsBackgroundInterface.onInitialized",
                    codec
                )
                if (api != null) {
                    channel.setMessageHandler { _, reply ->
                        var wrapped: List<Any?>
                        try {
                            api.onInitialized()
                            wrapped = listOf<Any?>(null)
                        } catch (exception: Throwable) {
                            wrapped = wrapError(exception)
                        }
                        reply.reply(wrapped)
                    }
                } else {
                    channel.setMessageHandler(null)
                }
            }
        }
    }
}

@Suppress("UNCHECKED_CAST")
private object QuickSettingsBackgroundToDartCodec : StandardMessageCodec() {
    override fun readValueOfType(type: Byte, buffer: ByteBuffer): Any? {
        return when (type) {
            128.toByte() -> {
                return (readValue(buffer) as? List<Any?>)?.let {
                    Tile.fromList(it)
                }
            }

            129.toByte() -> {
                return (readValue(buffer) as? List<Any?>)?.let {
                    Tile.fromList(it)
                }
            }

            else -> super.readValueOfType(type, buffer)
        }
    }

    override fun writeValue(stream: ByteArrayOutputStream, value: Any?) {
        when (value) {
            is Tile -> {
                stream.write(128)
                writeValue(stream, value.toList())
            }

            is Tile -> {
                stream.write(129)
                writeValue(stream, value.toList())
            }

            else -> super.writeValue(stream, value)
        }
    }
}

/** Generated class from Pigeon that represents Flutter messages that can be called from Kotlin. */
@Suppress("UNCHECKED_CAST")
class QuickSettingsBackgroundToDart(private val binaryMessenger: BinaryMessenger) {
    companion object {
        /** The codec used by QuickSettingsBackgroundToDart. */
        val codec: MessageCodec<Any?> by lazy {
            QuickSettingsBackgroundToDartCodec
        }
    }

    fun onTileClicked(userCallbackHandleArg: Long, tileArg: Tile, callback: (Tile?) -> Unit) {
        val channel = BasicMessageChannel<Any?>(
            binaryMessenger,
            "dev.flutter.pigeon.QuickSettingsBackgroundToDart.onTileClicked",
            codec
        )
        channel.send(listOf(userCallbackHandleArg, tileArg)) {
            val result = it as Tile?
            callback(result)
        }
    }

    fun onTileAdded(callbackHandleArg: Long, tileArg: Tile, callback: (Tile?) -> Unit) {
        val channel = BasicMessageChannel<Any?>(
            binaryMessenger,
            "dev.flutter.pigeon.QuickSettingsBackgroundToDart.onTileAdded",
            codec
        )
        channel.send(listOf(callbackHandleArg, tileArg)) {
            val result = it as Tile?
            callback(result)
        }
    }

    fun onTileRemoved(callbackHandleArg: Long, callback: () -> Unit) {
        val channel = BasicMessageChannel<Any?>(
            binaryMessenger,
            "dev.flutter.pigeon.QuickSettingsBackgroundToDart.onTileRemoved",
            codec
        )
        channel.send(listOf(callbackHandleArg)) {
            callback()
        }
    }
}
