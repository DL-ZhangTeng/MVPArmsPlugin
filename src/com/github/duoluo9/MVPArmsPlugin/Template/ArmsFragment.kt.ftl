package ${packageName}.mvp.ui.fragment

import android.content.Intent
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup

import com.jess.arms.base.BaseFragment
import com.jess.arms.di.component.AppComponent
import com.jess.arms.utils.ArmsUtils

import ${packageName}.di.component.Dagger${pageName}Component
import ${packageName}.di.module.${pageName}Module
import ${packageName}.mvp.contract.${pageName}Contract
import ${packageName}.mvp.presenter.${pageName}Presenter

import ${packageName}.R

/**
 * @className: ${pageName}Fragment
 * @description:
 * @author: ${author}
 * @date: ${date}
 */
class ${pageName}Fragment : BaseFragment<${pageName}Presenter>() , ${pageName}Contract.View{

    /**
     * @return ${pageName}Fragment
     * @description Fragment实例化方法
     */
    companion object {
        fun newInstance():${pageName}Fragment {
            val fragment = ${pageName}Fragment()
            return fragment
        }
    }


    /**
     * @param appComponent 公共的Dagger2组件（保存公共对象/单例对象）
     * @return void
     * @description 设置Fragment的Dagger2组件，管理页面相关实例
     */
    override fun setupFragmentComponent(appComponent:AppComponent) {
        Dagger${pageName}Component //如找不到该类,请编译一下项目
            .builder()
            .appComponent(appComponent)
            .${pageNameFun}Module(${pageName}Module(this))
            .build()
            .inject(this)
    }

    /**
     * @param inflater 页面渲染器
     * @param container 跟容器
     * @param savedInstanceState 保存数据对象
     * @return View 页面视图
     * @description 初始化视图
     */
    override fun initView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?):View{
        return inflater.inflate(R.layout.${fragmentLayoutName}, container, false);
    }

    /**
     * @param savedInstanceState 保存数据对象
     * @return void
     * @description 初始化数据
     */
    override fun initData(savedInstanceState:Bundle?) {

    }

    /**
     * @param data 数据
     * @return void
     * @description 设置数据
     */
    override fun setData(data:Any?) {

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

    }
}
