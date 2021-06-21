package ${packageName}.mvp.ui.activity;

import android.content.Intent;
import android.os.Bundle;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.jess.arms.base.BaseActivity;
import com.jess.arms.di.component.AppComponent;
import com.jess.arms.utils.ArmsUtils;

import ${packageName}.di.component.Dagger${pageName}Component;
import ${packageName}.mvp.contract.${pageName}Contract;
import ${packageName}.mvp.presenter.${pageName}Presenter;

import ${packageName}.R;

import static com.jess.arms.utils.Preconditions.checkNotNull;

/**
 * @className: ${pageName}Activity
 * @description:
 * @author: ${author}
 * @date: ${date}
 */
public class ${pageName}Activity extends BaseActivity<${pageName}Presenter> implements ${pageName}Contract.View {

    @Override
    public void setupActivityComponent(@NonNull AppComponent appComponent) {
        Dagger${pageName}Component //如找不到该类,请编译一下项目
                .builder()
                .appComponent(appComponent)
                .view(this)
                .build()
                .inject(this);
    }

    /**
     * @param savedInstanceState
     * @return 视图资源
     * @description 初始化视图，如果你不需要框架帮你设置 setContentView(id) 需要自行设置,请返回 0
     */
    @Override
    public int initView(@Nullable Bundle savedInstanceState) {
        return R.layout.${activityLayoutName};
    }

    /**
     * @param savedInstanceState
     * @return void
     * @description 初始化数据
     */
    @Override
    public void initData(@Nullable Bundle savedInstanceState) {

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
        finish();
    }
}
