package org.isotope.jfp.framework.support.common;

import org.isotope.jfp.framework.beans.pub.LogBean;
import org.isotope.jfp.framework.constants.ISFrameworkConstants;

/**
 * 日志记录类
 * @author Spook
 * @since 2.1.2
 * @version 2.1.2.20150417
 */
public interface ILogSupport {

	public static final String CONFIG_KEY = "JFP:LOGLIST";
	
	/**
	 * 短信发送
	 * @see ISFrameworkConstants.SEMICOLON
	 * @param log 日志信息
	 * @return 发送结果
	 */
	public boolean send(LogBean log);
	
}
