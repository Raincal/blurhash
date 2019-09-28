package com.raincal.blurhash

import android.graphics.Bitmap
import java.io.ByteArrayOutputStream
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class BlurhashPlugin: MethodCallHandler {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "blurhash")
      channel.setMethodCallHandler(BlurhashPlugin())
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "blurhashDecode") {
      val blurhash = call.argument<String>("blurhash")!!
      val width = call.argument<Int>("width")!!
      val height = call.argument<Int>("height")!!
      val punch = call.argument<Float>("punch")!!.toFloat()

      val bitmap = BlurHashDecoder.decode(blurhash, width, height, punch)

      if (bitmap == null) {
        result.error("INVALID_BLURHASH", "Failed to decode blurhash", null)
      }

      val stream = ByteArrayOutputStream()
      bitmap!!.compress(Bitmap.CompressFormat.PNG, 100, stream)
      val byteArray = stream.toByteArray()
      bitmap.recycle()

      result.success(byteArray)
    } else {
      result.notImplemented()
    }
  }
}
