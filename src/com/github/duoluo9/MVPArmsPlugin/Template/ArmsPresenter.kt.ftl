package ${packageName}.mvp.presenter

import android.app.Application

import com.jess.arms.integration.AppManager
${scopeLessImport}
import com.jess.arms.mvp.BasePresenter
import com.jess.arms.http.imageloader.ImageLoader
import me.jessyan.rxerrorhandler.core.RxErrorHandler
import javax.inject.Inject

import ${packageName}.mvp.contract.${pageName}Contract

${scope}
class ${pageName}Presenter
@Inject
constructor(model: ${pageName}Contract.Model, rootView: ${pageName}Contract.View) :
BasePresenter<${pageName}Contract.Model, ${pageName}Contract.View>(model,rootView) {
    @Inject
    lateinit var mErrorHandler:RxErrorHandler
    @Inject
    lateinit var mApplication:Application
    @Inject
    lateinit var mImageLoader:ImageLoader
    @Inject
    lateinit var mAppManager:AppManager


    override fun onDestroy() {
          super.onDestroy();
    }
}
