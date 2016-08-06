package com.mcookies.qxy.common.ClassTeacher;

import org.isotope.jfp.framework.support.MyDataBaseObjectSupport;
import org.isotope.jfp.framework.support.MyServiceSupport;
import org.isotope.jfp.framework.utils.DateHelper;
import org.springframework.stereotype.Service;

/** 班级教师关联表 */
@Service
public class ClassTeacherService extends MyServiceSupport {

	public ClassTeacherDao getDao() {
		return getMySqlSession().getMapper(ClassTeacherDao.class);
	}

	/**
	 * 更新数据
	 * 
	 * @param formParamBean
	 * @return
	 */
	public void doUpdateAll(MyDataBaseObjectSupport formParamBean) {
		changeTable(formParamBean, DB_UPDATE);
		// 更新者、更新时间
		String t =DateHelper.currentTimeMillis4();
		formParamBean.setUpdateTime(t);
		formParamBean.setUpdator(super.getLoginerId());
		getDao().doUpdateAll(formParamBean);
	}
}
