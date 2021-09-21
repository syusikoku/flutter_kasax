package cn.zy.flutter.plugin.kasax

import android.content.Context
import androidx.annotation.NonNull
import cn.zy.flutter.plugin.kasax.manager.UtilsManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

/** KasaxPlugin */
class KasaxPlugin(var context: Context) : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "cn.kasax/commmon_utils")
        channel.setMethodCallHandler(this)

        UtilsManager.inject(context)
    }


    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        val methodName = call.method
        if (methodName == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else if (methodName == "showLongToast") {
            val hasArgument = call.hasArgument("msg")
            if (hasArgument) {
                var msgContent = call.argument<String>("msg")
                if (msgContent != null) {
                    UtilsManager.getToast().showLongToast(msgContent)
                    result.success("1")
                } else {
                    result.error("0", "内容不能为空", null)
                }
            } else {
                result.error("0", "参数不能为空", null)
            }
        } else if (methodName == "showShortToast") {
            val hasArgument = call.hasArgument("msg")
            if (hasArgument) {
                var msgContent = call.argument<String>("msg")
                if (msgContent != null) {
                    UtilsManager.getToast().showShortToast(msgContent)
                    result.success("1")
                } else {
                    result.error("0", "内容不能为空", null)
                }
            } else {
                result.error("0", "参数不能为空", null)
            }
        } else {
            result.notImplemented()
        }
    }
}
