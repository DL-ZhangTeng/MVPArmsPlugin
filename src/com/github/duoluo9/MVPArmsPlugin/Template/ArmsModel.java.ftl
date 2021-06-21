package ${packageName}.mvp.model;

import android.app.Application;
import com.google.gson.Gson;
import com.jess.arms.integration.IRepositoryManager;
import com.jess.arms.mvp.BaseModel;

${scopeLessImport}

import javax.inject.Inject;

import ${packageName}.mvp.contract.${pageName}Contract;

/**
 * @className: ${pageName}Model
 * @description: Mvp的Model，用于获取数据
 * @author: ${author}
 * @date: ${date}
 */
${scope}
public class ${pageName}Model extends BaseModel implements ${pageName}Contract.Model{

    /**
     * @description: 注入gson对象，用于数据序列化
     */
    @Inject
    Gson mGson;

    /**
     * @description: 注入application
     */
    @Inject
    Application mApplication;

    /**
     * @param repositoryManager 数据仓库（数据请求实际执行者）
     * @description Model构造方法
     */
    @Inject
    public ${pageName}Model(IRepositoryManager repositoryManager) {
        super(repositoryManager);
    }

    /**
     * @return void
     * @description 释放对象引用，页面关闭后执行
     */
    @Override
    public void onDestroy() {
        super.onDestroy();
        this.mGson = null;
        this.mApplication = null;
    }
}