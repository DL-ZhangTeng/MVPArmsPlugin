package ${packageName}.di.module;

import dagger.Binds;
import dagger.Module;

import ${packageName}.mvp.contract.${pageName}Contract;
import ${packageName}.mvp.model.${pageName}Model;

@Module
public abstract class ${pageName}Module {

    @Binds
    abstract ${pageName}Contract.Model bind${pageName}Model(${pageName}Model model);
}