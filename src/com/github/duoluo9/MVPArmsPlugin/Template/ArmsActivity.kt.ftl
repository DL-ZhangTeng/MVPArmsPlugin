package ${packageName}.mvp.ui.activity

import android.content.Intent
import android.os.Bundle

import com.jess.arms.base.BaseActivity
import com.jess.arms.di.component.AppComponent
import com.jess.arms.utils.ArmsUtils

import ${packageName}.di.component.Dagger${pageName}Component
import ${packageName}.di.module.${pageName}Module
import ${packageName}.mvp.contract.${pageName}Contract
import ${packageName}.mvp.presenter.${pageName}Presenter

import ${packageName}.R

/**
 * @className: ${pageName}Activity
 * @description:
 * @author: ${author}
 * @date: ${date}
 */
class ${pageName}Activity : BaseActivity<${pageName}Presenter>() , ${pageName}Contract.View {

    override fun setupActivityComponent(appComponent:AppComponent) {
        Dagger${pageName}Component //如找不到该类,请编译一下项目
            .builder()
            .appComponent(appComponent)
            .${pageNameFun}Module(${pageName}Module(this))
            .build()
            .inject(this)
    }

    /**
     * @param savedInstanceState
     * @return 视图资源
     * @description 初始化视图，如果你不需要框架帮你设置 setContentView(id) 需要自行设置,请返回 0
     */
    override fun initView(savedInstanceState:Bundle?):Int {
        return R.layout.${activityLayoutName}
    }

    /**
     * @param savedInstanceState
     * @return void
     * @description 初始化数据
     */
    override fun initData(savedInstanceState:Bundle?) {

    }

    /**
     * @return void
     * @description 加载中动画展示
     */
    override fun showLoading() {

    }

    /**
     * @return void
     * @description 加载中动画隐藏
     */
    override fun hideLoading() {

    }

    /**
     * @param message
     * @return void
     * @description 底部弹出提示消息
     */
    override fun showMessage(message:String) {
        ArmsUtils.snackbarText(message)
    }

    /**
     * @param intent
     * @return void
     * @description 跳转页面
     */
    override fun launchActivity(intent:Intent) {
        ArmsUtils.startActivity(intent)
    }

    /**
     * @return void
     * @description 关闭页面
     */
    override fun killMyself() {
        finish()
    }
}
