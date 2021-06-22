package ${packageName}.mvp.presenter

import android.app.Application

import com.jess.arms.integration.AppManager
${scopeLessImport}
import com.jess.arms.mvp.BasePresenter
import com.jess.arms.http.imageloader.ImageLoader
import me.jessyan.rxerrorhandler.core.RxErrorHandler
import javax.inject.Inject

import ${packageName}.mvp.contract.${pageName}Contract

/**
 * @className: ${pageName}Presenter
 * @description: Mvp的Presenter，用于实际业务逻辑的处理
 * @author: ${author}
 * @date: ${date}
 */
${scope}
class ${pageName}Presenter
@Inject
constructor(model: ${pageName}Contract.Model, rootView: ${pageName}Contract.View) :
BasePresenter<${pageName}Contract.Model, ${pageName}Contract.View>(model,rootView) {

    /**
     * @description: 注入mErrorHandler，用于统一的异常处理
     */
    @Inject
    lateinit var mErrorHandler:RxErrorHandler

    /**
     * @description: 注入mApplication
     */
    @Inject
    lateinit var mApplication:Application

    /**
     * @description: 注入mImageLoader，用于图片加载
     */
    @Inject
    lateinit var mImageLoader:ImageLoader

    /**
     * @description: 注入mAppManager
     */
    @Inject
    lateinit var mAppManager:AppManager

    /**
     * @return void
     * @description 释放对象引用，页面关闭后执行
     */
    override fun onDestroy() {
        super.onDestroy()
    }
}
