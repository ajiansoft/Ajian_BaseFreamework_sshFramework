package com.ssh.framework.util.xml;


import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

/**   
 * ReadMailXml 概要说明  
 * 读取邮件配置的XML类   
 */
public class ReadMailXml {
	
	//根节点
	private Element root = null;    
	
	/**
     * 构造函数
     */
    public ReadMailXml(){    
        super();    
        //解析器对象  
        SAXBuilder sb = new SAXBuilder(); 
        try {
			//绑定文件
			Document doc = sb.build(this.getClass().getResourceAsStream("/mail.xml"));
	        //获取根元素    
	        root = doc.getRootElement();
		} catch (Exception e) {
			//读取xml文件异常
		} 
    }    
    
    /**
     * getMailXml方法概要说明
     * 得到指定节点的值
     * @param str 字符串
     * @return
     */
	public String getMailXml(String str){  
        String valueStr=null;
        if(root.getChildText(str) != null){
        	valueStr=root.getChildText(str);
        }
        return valueStr;            
    }    
}
