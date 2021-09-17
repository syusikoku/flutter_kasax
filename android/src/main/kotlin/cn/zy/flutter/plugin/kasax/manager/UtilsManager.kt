package cn.zy.flutter.plugin.kasax.manager

import android.content.Context
import cn.zy.flutter.plugin.kasax.utils.ToastUtils
import cn.zy.flutter.plugin.kasax.utils.UiUtils

class UtilsManager {
    companion object {
        private lateinit var context: Context
        private lateinit var uiUtils: UiUtils
        private lateinit var toastUtils: ToastUtils

        fun inject(ctx: Context) {
            context = ctx
            init()
        }

        private fun init() {
            toastUtils = ToastUtils.init(context)
            uiUtils = UiUtils.init(context)
        }

        fun getToast(): ToastUtils {
            return toastUtils
        }
    }
}