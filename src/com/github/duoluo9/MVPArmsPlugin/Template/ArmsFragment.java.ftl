package ${packageName}.mvp.ui.fragment;

import android.content.Intent;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.jess.arms.base.BaseFragment;
import com.jess.arms.di.component.AppComponent;
import com.jess.arms.utils.ArmsUtils;

import ${packageName}.di.component.Dagger${pageName}Component;
import ${packageName}.mvp.contract.${pageName}Contract;
import ${packageName}.mvp.presenter.${pageName}Presenter;

import ${packageName}.R;

import static com.jess.arms.utils.Preconditions.checkNotNull;

/**
 * @className: ${pageName}Fragment
 * @description:
 * @author: ${author}
 * @date: ${date}
 */
public class ${pageName}Fragment extends BaseFragment<${pageName}Presenter> implements ${pageName}Contract.View{

    /**
     * @return ${pageName}Fragment
     * @description Fragment实例化方法
     */
    public static ${pageName}Fragment newInstance() {
        ${pageName}Fragment fragment = new ${pageName}Fragment();
        return fragment;
    }

    /**
     * @param appComponent 公共的Dagger2组件（保存公共对象/单例对象）
     * @return void
     * @description 设置Fragment的Dagger2组件，管理页面相关实例
     */
    @Override
    public void setupFragmentComponent(@NonNull AppComponent appComponent) {
        Dagger${pageName}Component //如找不到该类,请编译一下项目
                .builder()
                .appComponent(appComponent)
                .view(this)
                .build()
                .inject(this);
    }

    /**
     * @param inflater 页面渲染器
     * @param container 跟容器
     * @param savedInstanceState 保存数据对象
     * @return View 页面视图
     * @description 初始化视图
     */
    @Override
    public View initView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        return inflater.inflate(R.layout.${fragmentLayoutName}, container, false);
    }

    /**
     * @param savedInstanceState 保存数据对象
     * @return void
     * @description 初始化数据
     */
    @Override
    public void initData(@Nullable Bundle savedInstanceState) {

    }

    /**
     * @param data 数据
     * @return void
     * @description 设置数据
     */
    @Override
    public void setData(@Nullable Object data) {

    }

    /**
     * @return void
     * @description 加载中动画展示
     */
    @Override
    public void showLoading() {

    }

    /**
     * @return void
     * @description 加载中动画隐藏
     */
    @Override
    public void hideLoading() {

    }

    /**
     * @param message
     * @return void
     * @description 底部弹出提示消息
     */
    @Override
    public void showMessage(@NonNull String message) {
        checkNotNull(message);
        ArmsUtils.snackbarText(message);
    }

    /**
     * @param intent
     * @return void
     * @description 跳转页面
     */
    @Override
    public void launchActivity(@NonNull Intent intent) {
        checkNotNull(intent);
        ArmsUtils.startActivity(intent);
    }

    /**
     * @return void
     * @description 关闭页面
     */
    @Override
    public void killMyself() {

    }
}
