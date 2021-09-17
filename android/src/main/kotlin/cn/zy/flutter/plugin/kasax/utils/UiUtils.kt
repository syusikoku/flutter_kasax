package cn.zy.flutter.plugin.kasax.utils

import android.content.Context

class UiUtils {
    companion object {
        private var instance = UiUtils()

        private lateinit var context: Context

        fun init(ctx: Context): UiUtils {
            context = ctx
            return instance
        }

    }
}