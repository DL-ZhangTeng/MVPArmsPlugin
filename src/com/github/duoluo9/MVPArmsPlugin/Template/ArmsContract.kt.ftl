package ${packageName}.mvp.contract

import com.jess.arms.mvp.IView
import com.jess.arms.mvp.IModel

/**
 * @className: ${pageName}Contract
 * @description: Mvp契约类，统一管理mvp的View与Model
 * @author: ${author}
 * @date: ${date}
 */
interface ${pageName}Contract {
    /**
     * @className: View
     * @description: 对于经常使用的关于UI的方法可以定义到IView中,如显示隐藏进度条,和显示文字消息
     * @author: ${author}
     * @date: ${date}
     */
    interface View : IView

    /**
     * @className: Model
     * @description: Model层定义接口,外部只需关心Model返回的数据,无需关心内部细节,即是否使用缓存
     * @author: ${author}
     * @date: ${date}
     */
    interface Model : IModel

}
