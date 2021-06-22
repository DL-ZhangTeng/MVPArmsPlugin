package ${packageName}.mvp.model

import android.app.Application
import com.google.gson.Gson
import com.jess.arms.integration.IRepositoryManager
import com.jess.arms.mvp.BaseModel

${scopeLessImport}

import javax.inject.Inject

import ${packageName}.mvp.contract.${pageName}Contract

/**
 * @className: ${pageName}Model
 * @description: Mvp的Model，用于获取数据
 * @author: ${author}
 * @date: ${date}
 */
${scope}
class ${pageName}Model
@Inject
constructor(repositoryManager: IRepositoryManager) : BaseModel(repositoryManager), ${pageName}Contract.Model{

    /**
     * @description: 注入gson对象，用于数据序列化
     */
    @Inject
    lateinit var mGson: Gson

    /**
     * @description: 注入application
     */
    @Inject
    lateinit var mApplication: Application

    /**
     * @return void
     * @description 释放对象引用，页面关闭后执行
     */
    override fun onDestroy() {
        super.onDestroy()
    }
}
