import com.intellij.openapi.actionSystem.AnAction;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.actionSystem.PlatformDataKeys;
import com.intellij.openapi.project.Project;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MVPArmsPluginAction extends AnAction {


    private Project project;
    //包名
    private String packageName = "";
    private String pageName;


    private enum CodeType {
        Activity, COMPONENT, Contract, Presenter, MODEL, MODULE, LAYOUT
    }

    @Override
    public void actionPerformed(AnActionEvent e) {
        project = e.getData(PlatformDataKeys.PROJECT);
        packageName = getPackageName();
        init();
        refreshProject(e);
    }

    /**
     * 刷新项目
     *
     * @param e
     */
    private void refreshProject(AnActionEvent e) {
        e.getProject().getBaseDir().refresh(false, true);
    }

    /**
     * 初始化Dialog
     */
    private void init() {
        MyDialog myDialog = new MyDialog(pageName -> {
            MVPArmsPluginAction.this.pageName = pageName;
            createClassFiles();
        });
        myDialog.setVisible(true);

    }

    /**
     * 生成类文件
     */
    private void createClassFiles() {
        createClassFile(CodeType.Activity);
        createClassFile(CodeType.Contract);
        createClassFile(CodeType.Presenter);
        createClassFile(CodeType.COMPONENT);
        createClassFile(CodeType.MODEL);
        createClassFile(CodeType.MODULE);
        createClassFile(CodeType.LAYOUT);
    }

    /**
     * 生成mvp框架代码
     *
     * @param codeType
     */
    private void createClassFile(CodeType codeType) {
        String fileName = "";
        String content = "";
        String appPath = getAppPath();
        switch (codeType) {
            case Activity:
                fileName = "ArmsActivity.kt.ftl";
                content = ReadTemplateFile(fileName);
                content = dealTemplateContent(content);
                writeToFile(content, appPath + "mvp/ui/activity", pageName + "Activity.kt");
                break;
            case Contract:
                fileName = "ArmsContract.kt.ftl";
                content = ReadTemplateFile(fileName);
                content = dealTemplateContent(content);
                writeToFile(content, appPath + "mvp/contract", pageName + "Contract.kt");
                break;
            case Presenter:
                fileName = "ArmsPresenter.kt.ftl";
                content = ReadTemplateFile(fileName);
                content = dealTemplateContent(content);
                writeToFile(content, appPath + "mvp/presenter", pageName + "Presenter.kt");
                break;
            case MODEL:
                fileName = "ArmsModel.kt.ftl";
                content = ReadTemplateFile(fileName);
                content = dealTemplateContent(content);
                writeToFile(content, appPath + "mvp/model", pageName + "Model.kt");
                break;
            case COMPONENT:
                fileName = "ArmsComponent.java.ftl";
                content = ReadTemplateFile(fileName);
                content = dealTemplateContent(content);
                writeToFile(content, appPath + "di/component", pageName + "Component.java");
                break;
            case MODULE:
                fileName = "ArmsModule.java.ftl";
                content = ReadTemplateFile(fileName);
                content = dealTemplateContent(content);
                writeToFile(content, appPath + "di/module", pageName + "Module.java");
                break;
            case LAYOUT:
                fileName = "simple.xml.ftl";
                content = ReadTemplateFile(fileName);
                writeToFile(content, getAppResPath(), "activity_" + pageName.toLowerCase() + ".xml");
                break;
        }
    }

    /**
     * 获取包名文件路径
     *
     * @return
     */
    private String getAppPath() {
        String packagePath = packageName.replace(".", "/");
        String appPath = project.getBasePath() + "/App/src/main/java/" + packagePath + "/";
        return appPath;
    }

    /**
     * 获取包名文件路径
     *
     * @return
     */
    private String getAppResPath() {
        String packagePath = packageName.replace(".", "/");
        String appPath = project.getBasePath() + "/App/src/main/res/layout/";
        return appPath;
    }

    /**
     * 替换模板中字符
     *
     * @param content
     * @return
     */
    private String dealTemplateContent(String content) {
        content = content.replace("${pageName}", pageName);
        if (content.contains("${packageName}")) {
            content = content.replace("${packageName}", packageName);
        }
        if (content.contains("${activityLayoutName}")) {
            content = content.replace("${activityLayoutName}", "activity_" + pageName.toLowerCase());
        }

        return content;
    }

    /**
     * 获取当前时间
     *
     * @return
     */
    public String getDate() {
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
        String dateString = formatter.format(currentTime);
        return dateString;
    }


    /**
     * 读取模板文件中的字符内容
     *
     * @param fileName 模板文件名
     * @return
     */
    private String ReadTemplateFile(String fileName) {
        InputStream in = null;
        in = this.getClass().getResourceAsStream("/Template/" + fileName);
        String content = "";
        try {
            content = new String(readStream(in));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return content;
    }


    private byte[] readStream(InputStream inputStream) throws IOException {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int len = -1;
        try {
            while ((len = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, len);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            outputStream.close();
            inputStream.close();
        }

        return outputStream.toByteArray();
    }


    /**
     * 生成
     *
     * @param content   类中的内容
     * @param classPath 类文件路径
     * @param className 类文件名称
     */
    private void writeToFile(String content, String classPath, String className) {
        try {
            File floder = new File(classPath);
            if (!floder.exists()) {
                floder.mkdirs();
            }

            File file = new File(classPath + "/" + className);
            if (!file.exists()) {
                file.createNewFile();
            }

            FileWriter fw = new FileWriter(file.getAbsoluteFile());
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write(content);
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    /**
     * 从AndroidManifest.xml文件中获取当前app的包名
     *
     * @return
     */
    private String getPackageName() {
        String package_name = "";
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        try {
            DocumentBuilder db = dbf.newDocumentBuilder();
            Document doc = db.parse(project.getBasePath() + "/App/src/main/AndroidManifest.xml");

            NodeList nodeList = doc.getElementsByTagName("manifest");
            for (int i = 0; i < nodeList.getLength(); i++) {
                Node node = nodeList.item(i);
                Element element = (Element) node;
                package_name = element.getAttribute("package");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return package_name;
    }
}
