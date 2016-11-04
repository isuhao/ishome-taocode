package com.mcookies.qxy.common.ClassStudent;

import javax.inject.Named;

import org.isotope.jfp.framework.support.MyDataBaseObjectSupport;

@Named
/** 班级学生关联表 */
public class ClassStudentDBO extends MyDataBaseObjectSupport {
	/**
	 * 自增id
	 */
	private Long id = null;

	/**
	 * 学校id
	 */
	private Long sid = null;

	/**
	 * 班级id
	 */
	private Long cid = null;

	/**
	 * 学生id
	 */
	private Long studentId = null;

	/**
	 * 加入班级时间
	 */
	private String joinTime = null;

	/**
	 * 退出班级时间
	 */
	private String exitTime = null;

	/**
	 * 是否启用
	 */
	private Integer isUse = null;

	/**
	 * 获取自增id
	 *
	 * @return Id 自增id
	 */
	public Long getId() {
		return this.id;
	}

	/**
	 * 获取学校id
	 *
	 * @return Sid 学校id
	 */
	public Long getSid() {
		return this.sid;
	}

	/**
	 * 获取班级id
	 *
	 * @return Cid 班级id
	 */
	public Long getCid() {
		return this.cid;
	}

	/**
	 * 获取学生id
	 *
	 * @return Student_id 学生id
	 */
	public Long getStudentId() {
		return this.studentId;
	}

	/**
	 * 获取加入班级时间
	 *
	 * @return Join_time 加入班级时间
	 */
	public String getJoinTime() {
		return this.joinTime;
	}

	/**
	 * 获取退出班级时间
	 *
	 * @return Exit_time 退出班级时间
	 */
	public String getExitTime() {
		return this.exitTime;
	}

	/**
	 * 获取是否启用
	 *
	 * @return Is_use 是否启用
	 */
	public Integer getIsUse() {
		return this.isUse;
	}

	/**
	 * 设置自增id
	 *
	 * @param Id
	 *            自增id
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * 设置学校id
	 *
	 * @param Sid
	 *            学校id
	 */
	public void setSid(Long sid) {
		this.sid = sid;
	}

	/**
	 * 设置班级id
	 *
	 * @param Cid
	 *            班级id
	 */
	public void setCid(Long cid) {
		this.cid = cid;
	}

	/**
	 * 设置学生id
	 *
	 * @param Student_id
	 *            学生id
	 */
	public void setStudentId(Long studentid) {
		this.studentId = studentid;
	}

	/**
	 * 设置加入班级时间
	 *
	 * @param Join_time
	 *            加入班级时间
	 */
	public void setJoinTime(String jointime) {
		this.joinTime = jointime;
	}

	/**
	 * 设置退出班级时间
	 *
	 * @param Exit_time
	 *            退出班级时间
	 */
	public void setExitTime(String exittime) {
		this.exitTime = exittime;
	}

	/**
	 * 设置是否启用
	 *
	 * @param Is_use
	 *            是否启用
	 */
	public void setIsUse(Integer isuse) {
		this.isUse = isuse;
	}

}