package ${packageName}.di.component;

import dagger.BindsInstance;
import dagger.Component;
import com.jess.arms.di.component.AppComponent;

import ${packageName}.di.module.${pageName}Module
import ${packageName}.mvp.contract.${pageName}Contract

import com.jess.arms.di.scope.ActivityScope;
import ${packageName}.mvp.ui.activity.${pageName}Activity;

@ActivityScope
@Component(modules = ${pageName}Module.class, dependencies = AppComponent.class)
public interface ${pageName}Component {

    void inject(${pageName}Activity activity);

    @Component.Builder
    interface Builder {
        @BindsInstance
        ${pageName}Component.Builder view(${pageName}Contract.View view);
        ${pageName}Component.Builder appComponent(AppComponent appComponent);
        ${pageName}Component build();
    }
}