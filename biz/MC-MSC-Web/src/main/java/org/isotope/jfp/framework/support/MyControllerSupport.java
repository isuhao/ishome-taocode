package org.isotope.jfp.framework.support;

import javax.annotation.Resource;

import org.isotope.jfp.framework.beans.common.RESTResultBean;
import org.isotope.jfp.framework.beans.page.PageVOSupport;
import org.isotope.jfp.framework.beans.user.UserBean;
import org.isotope.jfp.framework.cache.ICacheService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 画面控制层超类
 * 
 * @author Spook
 * @since 0.1.0
 * @version 0.1.0 2016/8/8
 */
public class MyControllerSupport extends MyFrameworkSupport {
	protected Logger logger = LoggerFactory.getLogger(this.getClass());

	/**
	 * 分页参数
	 */
	@Resource
	protected PageVOSupport pageModel;

	/**
	 * Redis缓存
	 */
	@Resource
	protected ICacheService myCache;

	/**
	 * 当前用户
	 */
	private UserBean loginer;

	public UserBean getLoginer() {
		return loginer;
	}

	public boolean doCheckToken(String token) {
		// 检查用户Token
		// loginer = super.checkLoginer(token);
		{// 临时代码
			// 获得用户信息
			loginer = new UserBean();
			loginer.setUserId(123456789L);
			loginer.setSchoolId(987654321L);
			loginer.setToken("911822733644555466377288199__a__b__c__d__e__f__g");
		}
		// 缓存Session
		super.setUserData(loginer);
		return true;
	}

	public RESTResultBean tokenFail() {
		RESTResultBean result = new RESTResultBean();
		result.setStatus(12);
		result.setInfo("token is timeout");
		return result;
	}

}
