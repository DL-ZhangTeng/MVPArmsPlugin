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
    var mErrorHandler:RxErrorHandler? = null

    /**
     * @description: 注入mApplication
     */
    @Inject
    var mApplication:Application? = null

    /**
     * @description: 注入mImageLoader，用于图片加载
     */
    @Inject
    var mImageLoader:ImageLoader? = null

    /**
     * @description: 注入mAppManager
     */
    @Inject
    var mAppManager:AppManager? = null

    /**
     * @return void
     * @description 释放对象引用，页面关闭后执行
     */
    override fun onDestroy() {
        super.onDestroy()
        mErrorHandler = null
        mAppManager = null
        mImageLoader = null
        mApplication = null
    }
}
