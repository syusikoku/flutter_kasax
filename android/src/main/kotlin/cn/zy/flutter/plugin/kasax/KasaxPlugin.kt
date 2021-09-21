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
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "kasax")
        channel.setMethodCallHandler(this)

        UtilsManager.inject(context)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else if (call.method == "showLongToast") {
            var msg = call.params["msg"];
            if(msg!=null){
                UtilsManager.getToast().showLongToast(msg)
                result.sucess(1)
            }else{
                result.sucess(0)
            }
        } else if (call.method == "showShortToast") {
            var msg = call.params["msg"];
            if(msg!=null){
                UtilsManager.getToast().showShortToast(msg)
                result.sucess(1)
            }else{
                result.sucess(0)
            }
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
