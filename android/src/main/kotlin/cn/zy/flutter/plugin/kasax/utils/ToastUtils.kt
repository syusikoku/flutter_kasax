package cn.zy.flutter.plugin.kasax.utils

import android.content.Context
import android.widget.Toast

class ToastUtils {

    companion object {
        private var instance = ToastUtils()

        private lateinit var context: Context

        fun init(ctx: Context): ToastUtils {
            context = ctx
            return instance
        }


    }

    fun showLongToast(msg: String) {
        Toast.makeText(context, msg, Toast.LENGTH_LONG).show()
    }

    fun showShortToast(msg: String) {
        Toast.makeText(context, msg, Toast.LENGTH_SHORT).show()
    }
}