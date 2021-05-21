package ${packageName}.mvp.model

import android.app.Application
import com.google.gson.Gson
import com.jess.arms.integration.IRepositoryManager
import com.jess.arms.mvp.BaseModel

${scopeLessImport}

import javax.inject.Inject

import ${packageName}.mvp.contract.${pageName}Contract

${scope}
class ${pageName}Model
@Inject
constructor(repositoryManager: IRepositoryManager) : BaseModel(repositoryManager), ${pageName}Contract.Model{
    @Inject
    lateinit var mGson:Gson;
    @Inject
    lateinit var mApplication:Application;

    override fun onDestroy() {
          super.onDestroy();
    }
}
