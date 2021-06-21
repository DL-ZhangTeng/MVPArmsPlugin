package ${packageName}.di.module;

import dagger.Binds;
import dagger.Module;

import ${packageName}.mvp.contract.${pageName}Contract;
import ${packageName}.mvp.model.${pageName}Model;

/**
 * @className: ${pageName}Module
 * @description: Dagger2的Module，实例的实际引用持有者
 * @author: ${author}
 * @date: ${date}
 */
@Module
public abstract class ${pageName}Module {

    /**
     * @param model
     * @return ${pageName}Contract.Model
     * @description 将mvp的Model实例加入管理
     */
    @Binds
    abstract ${pageName}Contract.Model bind${pageName}Model(${pageName}Model model);
}