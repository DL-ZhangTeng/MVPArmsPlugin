package ${packageName}.di.component

import dagger.Component
import com.jess.arms.di.component.AppComponent

import ${packageName}.di.module.${pageName}Module

${scopeImport}

${scope}
@Component(modules = arrayOf(${pageName}Module::class),dependencies = arrayOf(AppComponent::class))
interface ${pageName}Component {
    ${inject}
}
