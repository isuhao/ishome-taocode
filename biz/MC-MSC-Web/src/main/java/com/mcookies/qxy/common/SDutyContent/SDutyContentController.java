package com.mcookies.qxy.common.SDutyContent;

import javax.annotation.Resource;

import org.isotope.jfp.framework.support.MyControllerSupport;
import org.springframework.stereotype.Controller;

@Controller
/** 岗位内容设置表 */
public class SDutyContentController extends MyControllerSupport {
	@Resource
	protected SDutyContentService SDutyContentService_;

}