package ${packageName}.di.module

${scopeLessImport}

import dagger.Module
import dagger.Provides

import ${packageName}.mvp.contract.${pageName}Contract
import ${packageName}.mvp.model.${pageName}Model

/**
 * @className: ${pageName}Module
 * @description: Dagger2的Module，实例的实际引用持有者，默认初始化需要传入Mvp的View
 * @author: ${author}
 * @date: ${date}
 */
@Module
class ${pageName}Module(private val view:${pageName}Contract.View) {

    /**
     * @return ${pageName}Contract.View
     * @description 将mvp的View实例加入管理
     */
    ${scope}
    @Provides
    fun provide${pageName}View():${pageName}Contract.View{
        return this.view
    }

    /**
     * @param model
     * @return ${pageName}Contract.Model
     * @description 将mvp的Model实例加入管理
     */
    ${scope}
    @Provides
    fun provide${pageName}Model(model:${pageName}Model):${pageName}Contract.Model{
        return model
    }
}
