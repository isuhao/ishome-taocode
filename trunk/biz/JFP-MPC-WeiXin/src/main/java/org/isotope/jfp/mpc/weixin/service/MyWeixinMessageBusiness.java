package org.isotope.jfp.mpc.weixin.service;

import javax.annotation.Resource;

import org.isotope.jfp.common.weixin.WeixinService;
import org.isotope.jfp.framework.constants.ISFrameworkConstants;
import org.isotope.jfp.mpc.weixin.beans.WeiXinMessageValueBean;
import org.isotope.jfp.mpc.weixin.service.tx.TXWeixinService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 微信对接服务
 * 
 * @author spookfcy
 * @since 3.3.1
 * @version 3.3.1.20160825
 * 
 */
public class MyWeixinMessageBusiness implements ISFrameworkConstants {

	protected Logger logger = LoggerFactory.getLogger(this.getClass());
	@Resource
	WeixinService WeixinService_;
	@Resource
	TXWeixinService TXWeixinService_;

	public String sendToCompanyId(String companyId, WeiXinMessageValueBean message) {
		// TODO Auto-generated method stub
		return null;
	}

	public String sendToCompanyIdGroupId(String companyId, String groupId, WeiXinMessageValueBean message) {
		// TODO Auto-generated method stub
		return null;
	}

	public String sendToCompanyIdUserId(String companyId, String userId, WeiXinMessageValueBean message) {
		// TODO Auto-generated method stub
		return null;
	}

}
