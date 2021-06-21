package ${packageName}.di.component

import dagger.Component
import com.jess.arms.di.component.AppComponent

import ${packageName}.di.module.${pageName}Module

${scopeImport}

/**
 * @className: ${pageName}Component
 * @description: Dagger2组件注入实例
 * @author: ${author}
 * @date: ${date}
 */
${scope}
@Component(modules = arrayOf(${pageName}Module::class),dependencies = arrayOf(AppComponent::class))
interface ${pageName}Component {
    ${inject}
}
