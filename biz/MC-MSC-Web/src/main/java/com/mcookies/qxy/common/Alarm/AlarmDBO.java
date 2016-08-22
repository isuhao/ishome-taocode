package com.mcookies.qxy.common.Alarm;
import java.sql.Date;

import javax.inject.Named;

import org.isotope.jfp.framework.support.MyDataBaseObjectSupport;
 
@Named
/** 报警表*/
public class AlarmDBO extends MyDataBaseObjectSupport
{
    /** 
     * 自增id
     */
    private Long alarmId = null;
 
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
     * 日期
     */
    private String date = null;
 
    /** 
     * 开始时间
     */
    private Date startTime = null;
 
    /** 
     * 结束时间
     */
    private Date endTime = null;
 
    /** 
     * 学校设备id
     */
    private Long deviceId = null;
 
    /** 
     * 规定行为状态
     */
    private Long flag = null;
 
    /** 
     * 实际行为状态
     */
    private Long actualFlag = null;
 
    /** 
     * 是否报警
     */
    private Long isAlarm = null;
 
    /** 
     * 是否启用
     */
    private Integer isUse = null;
  
    /** 
     * 获取自增id
     *
     * @return Alarm_id 自增id
     */
    public Long getAlarmId() {
        return this.alarmId;
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
     * 获取日期
     *
     * @return Date 日期
     */
    public String getDate() {
        return this.date;
    }
 
    /** 
     * 获取开始时间
     *
     * @return Start_time 开始时间
     */
    public Date getStartTime() {
        return this.startTime;
    }
 
    /** 
     * 获取结束时间
     *
     * @return End_time 结束时间
     */
    public Date getEndTime() {
        return this.endTime;
    }
 
    /** 
     * 获取学校设备id
     *
     * @return Device_id 学校设备id
     */
    public Long getDeviceId() {
        return this.deviceId;
    }
 
    /** 
     * 获取规定行为状态
     *
     * @return Flag 规定行为状态
     */
    public Long getFlag() {
        return this.flag;
    }
 
    /** 
     * 获取实际行为状态
     *
     * @return Actual_flag 实际行为状态
     */
    public Long getActualFlag() {
        return this.actualFlag;
    }
 
    /** 
     * 获取是否报警
     *
     * @return Is_alarm 是否报警
     */
    public Long getIsAlarm() {
        return this.isAlarm;
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
     * @param Alarm_id 自增id
     */
    public void setAlarmId(Long alarmid) {
        this.alarmId = alarmid;
    }
 
    /** 
     * 设置学校id
     *
     * @param Sid 学校id
     */
    public void setSid(Long sid) {
        this.sid = sid;
    }
 
    /** 
     * 设置班级id
     *
     * @param Cid 班级id
     */
    public void setCid(Long cid) {
        this.cid = cid;
    }
 
    /** 
     * 设置学生id
     *
     * @param Student_id 学生id
     */
    public void setStudentId(Long studentid) {
        this.studentId = studentid;
    }
 
    /** 
     * 设置日期
     *
     * @param Date 日期
     */
    public void setDate(String date) {
        this.date = date;
    }
 
    /** 
     * 设置开始时间
     *
     * @param Start_time 开始时间
     */
    public void setStartTime(Date starttime) {
        this.startTime = starttime;
    }
 
    /** 
     * 设置结束时间
     *
     * @param End_time 结束时间
     */
    public void setEndTime(Date endtime) {
        this.endTime = endtime;
    }
 
    /** 
     * 设置学校设备id
     *
     * @param Device_id 学校设备id
     */
    public void setDeviceId(Long deviceid) {
        this.deviceId = deviceid;
    }
 
    /** 
     * 设置规定行为状态
     *
     * @param Flag 规定行为状态
     */
    public void setFlag(Long flag) {
        this.flag = flag;
    }
 
    /** 
     * 设置实际行为状态
     *
     * @param Actual_flag 实际行为状态
     */
    public void setActualFlag(Long actualflag) {
        this.actualFlag = actualflag;
    }
 
    /** 
     * 设置是否报警
     *
     * @param Is_alarm 是否报警
     */
    public void setIsAlarm(Long isalarm) {
        this.isAlarm = isalarm;
    }
 
    /** 
     * 设置是否启用
     *
     * @param Is_use 是否启用
     */
    public void setIsUse(Integer isuse) {
        this.isUse = isuse;
    }
 
}