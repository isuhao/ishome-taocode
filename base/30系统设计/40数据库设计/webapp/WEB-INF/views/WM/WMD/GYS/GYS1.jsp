<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册 - 爱医康医用耗材信息服务平台</title>
<meta http-equiv="keywords" content="爱医康,供应商登录,医院登录" />
<meta http-equiv="description" content="爱医康平台账户登录页面。" />
<%@ include file="/resources/jsp/main/inc.jsp" %>
</head>
<body>
	<!-- content -->
	<div class="content-bd">
		<div class="t-box">
			<div class="t-box-hd">爱医康注册</div>
			<div class="t-box-bd t-a-c f14">
				<div class="flowPath-mod w710 m0a">
					<ul class="flowPath">
						<li class="flowPath-item cur">
							<div class="flowPath-item-img img1"></div>
							<div class="flowPath-item-text">验证身份信息</div>
						</li>
						<li class="flowPath-item flowPath-line"></li>
						<li  class="flowPath-item">
							<div class="flowPath-item-img img2"></div>
							<div class="flowPath-item-text">验证账号信息</div>
						</li>
						<li class="flowPath-item flowPath-line"></li>
						<li  class="flowPath-item">
							<div class="flowPath-item-img img-suc"></div>
							<div class="flowPath-item-text">注册成功</div>
						</li>
					</ul>
				</div>
				<div class="tabs-mod tabs-max-2 w710 m0a">
					<div class="tabs-hd">
						<ul>
							<li><a href="/resources/jsp/main/yy.jsp">医院注册<div class="arrow"></div></a></li>
							<li class="selected">供应商注册<div class="arrow"></div></li>
						</ul>
					</div>
					<div class="tabs-bd">
						<ul>
							<li>
								<!-- form -->
								<form id="reg-form" action="/31401042" method="post">
									<div class="form-item">
										<div class="form-item-left"><em>*</em>供应商全称：</div>
										<div class="form-item-right">
											<div class="preloader-mod input-text arrow">
												<input name="f02_qyqc" id="f02_qyqc" value="${UserData.f02_qyqc}" class="text" style="width:275px;" type="text" placeholder="请输入供应商全称"/>
												<span class="arrow-ico"></span>
											</div>
										</div>
									</div>
									<div class="form-item">
										<div class="form-item-left"><em>*</em>供应商简称：</div>
										<div class="form-item-right">
											<div class="input-text">
												<input type="text" name="f01_qyjc" id="f01_qyjc" class="text w300" value="${UserData.f01_qyjc}"/>
											</div>
										</div>
									</div>
									<div class="form-item">
										<div class="form-item-left"><em>*</em>注册地址：</div>
										<div class="form-item-right">
											<div class="pca-mod clear">
											<select id="f13_szs" name="f13_szs" class="select pca-item province" value="${UserData.f13_szs}" ></select>
											<select id="f14_szs" name="f14_szs" class="select pca-item city" value="${UserData.f14_szs}" ></select>
											<select id="f15_szq" name="f15_szq" class="select pca-item area" value="${UserData.f15_szq}" ></select>
											<div class="input-text pca-addr">
												<input class="text w300" placeholder="详细地址" name="f16_szxxdz" type="text" id="f16_szxxdz" value="${UserData.f16_szxxdz}" class="text"/>
											</div>
											</div>
										</div>
									</div>
									<div class="form-item">
										<div class="form-item-left"><em>*</em>固定电话：</div>
										<div class="form-item-right">
											<div class="input-text">
												<input type="text" name="f18_lxdh" id="f18_lxdh" value="${UserData.f18_lxdh}" class="text w300" />
											</div>
										</div>
									</div>
									<div class="form-item">
										<div class="form-item-left">法人代表名称：</div>
										<div class="form-item-right">
											<div class="input-text">
												<input type="text" name="f08_frxm" id="f08_frxm" class="text w120" value="${UserData.f08_frxm}"/>
											</div>
										</div>
									</div>
									<div class="form-bottom">
										<input type="submit" value="下一步" class="button blue-buttom" />
									</div>
									<input type="hidden" name="eb5" id="eb5" value="${UserData.eb5}"/>
									<input type="hidden" name="puk" id="puk" value="${UserData.puk}"/>
								</form>
								<!-- end form -->
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>