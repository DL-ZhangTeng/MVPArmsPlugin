package ${packageName}.di.module

${scopeLessImport}

import dagger.Module
import dagger.Provides

import ${packageName}.mvp.contract.${pageName}Contract
import ${packageName}.mvp.model.${pageName}Model

@Module
class ${pageName}Module(private val view:${pageName}Contract.View) {
    ${scope}
    @Provides
    fun provide${pageName}View():${pageName}Contract.View{
        return this.view
    }

    ${scope}
    @Provides
    fun provide${pageName}Model(model:${pageName}Model):${pageName}Contract.Model{
        return model
    }
}
