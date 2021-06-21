package ${packageName}.di.component;

import dagger.BindsInstance;
import dagger.Component;
import com.jess.arms.di.component.AppComponent;

import ${packageName}.di.module.${pageName}Module;
import ${packageName}.mvp.contract.${pageName}Contract;

${scopeImport}

/**
 * @className: ${pageName}Component
 * @description: Dagger2组件注入实例
 * @author: ${author}
 * @date: ${date}
 */
${scope}
@Component(modules = ${pageName}Module.class, dependencies = AppComponent.class)
public interface ${pageName}Component {

    ${inject}

    /**
     * @className: Builder
     * @description: Dagger2组件构造器（用于将已初始化的实例交给dagger2管理）
     * @author: ${author}
     * @date: ${date}
     */
    @Component.Builder
    interface Builder {

        /**
        * @param view 注入view
        * @return ${pageName}Component.Builder
        * @description 向dagger2提供view实例，给Presenter注入view使用
        */
        @BindsInstance
        ${pageName}Component.Builder view(${pageName}Contract.View view);

        /**
        * @param appComponent 传入appComponent
        * @return ${pageName}Component.Builder
        * @description 向dagger2提供appComponent实例，用于获取公共对象或单例对象
        */
        ${pageName}Component.Builder appComponent(AppComponent appComponent);

        /**
        * @return ${pageName}Component.Builder
        * @description 构造${pageName}Component组件
        */
        ${pageName}Component build();
    }
}