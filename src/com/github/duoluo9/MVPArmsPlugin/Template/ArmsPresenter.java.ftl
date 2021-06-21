package ${packageName}.mvp.presenter;

import android.app.Application;

import com.jess.arms.integration.AppManager;
${scopeLessImport}
import com.jess.arms.mvp.BasePresenter;
import com.jess.arms.http.imageloader.ImageLoader;
import me.jessyan.rxerrorhandler.core.RxErrorHandler;
import javax.inject.Inject;

import ${packageName}.mvp.contract.${pageName}Contract;

/**
 * @className: ${pageName}Presenter
 * @description: Mvp的Presenter，用于实际业务逻辑的处理
 * @author: ${author}
 * @date: ${date}
 */
${scope}
public class ${pageName}Presenter extends BasePresenter<${pageName}Contract.Model, ${pageName}Contract.View> {

    /**
     * @description: 注入mErrorHandler，用于统一的异常处理
     */
    @Inject
    RxErrorHandler mErrorHandler;

    /**
     * @description: 注入mApplication
     */
    @Inject
    Application mApplication;

    /**
     * @description: 注入mImageLoader，用于图片加载
     */
    @Inject
    ImageLoader mImageLoader;

    /**
     * @description: 注入mAppManager
     */
    @Inject
    AppManager mAppManager;

    /**
     * @param model 注入model层对象
     * @param rootView 注入view层对象
     * @description Presenter构造方法
     */
    @Inject
    public ${pageName}Presenter (${pageName}Contract.Model model, ${pageName}Contract.View rootView) {
        super(model, rootView);
    }

    /**
     * @return void
     * @description 释放对象引用，页面关闭后执行
     */
    @Override
    public void onDestroy() {
        super.onDestroy();
        this.mErrorHandler = null;
        this.mAppManager = null;
        this.mImageLoader = null;
        this.mApplication = null;
    }
}
