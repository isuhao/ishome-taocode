package org.isotope.jfp.mpc.weixin.beans;

import org.isotope.jfp.framework.beans.message.info.UserReceverBean;

/**
 * 微信用户信息
 * 
 * @author spookfcy
 * @since 3.3.1
 * @version 3.3.1.20160825
 *
 */
public class WeiXinUserReceverBean extends UserReceverBean {

	/**
	 * 用户ID
	 */
	private String userId;

	/**
	 * 学校id
	 */
	private Long sid = null;

	/**
	 * 用户类别
	 */
	private Integer uertType = null;

	/**
	 * 用户昵称
	 */
	private String userName = null;

	/**
	 * openId
	 */
	private String openid = null;

	/**
	 * 关注学校企业号ID
	 */
	private String schoolAppId = null;

	/**
	 * 是否启用
	 */
	private Integer isUse = null;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Long getSid() {
		return sid;
	}

	public void setSid(Long sid) {
		this.sid = sid;
	}

	public Integer getUertType() {
		return uertType;
	}

	public void setUertType(Integer uertType) {
		this.uertType = uertType;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public String getSchoolAppId() {
		return schoolAppId;
	}

	public void setSchoolAppId(String schoolAppId) {
		this.schoolAppId = schoolAppId;
	}

	public Integer getIsUse() {
		return isUse;
	}

	public void setIsUse(Integer isUse) {
		this.isUse = isUse;
	}

}