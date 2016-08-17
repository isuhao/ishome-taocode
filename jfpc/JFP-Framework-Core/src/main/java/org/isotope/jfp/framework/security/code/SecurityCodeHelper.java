package org.isotope.jfp.framework.security.code;

import org.isotope.jfp.framework.cache.redis.RedisCacheHelper;
import org.isotope.jfp.framework.constants.ISFrameworkConstants;
import org.isotope.jfp.framework.constants.pub.ISModelConstants;
import org.isotope.jfp.framework.utils.RandomHelper;

/**
 * 验证码工具类
 * @author 001745
 * @author Spook
 * @since 3.2.1
 * @version 3.2.1 2016/08/17
 * @see <RedisCacheHelper>
 */
public class SecurityCodeHelper implements ISFrameworkConstants, ISModelConstants {

	/**
	 * 生成验证码
	 * 
	 * @param second
	 *            有效时间（秒）
	 * @param length
	 *            长度
	 */
	
	public static String makeRandomNumCode(int second, int length, String jobid) {
		String code = RandomHelper.getRandomNumerical(length);
		RedisCacheHelper.setSessionAttribute(1, second, jobid, code);
		return code;
	}

	/**
	 * 
	 * @param type
	 *            验证码类别（0：区分大小写,1：不区分
	 * @param second
	 *            有效时间（秒）
	 * @param length
	 */
	public static String makeRandomStrCode(int type, int second, int length, String jobid) {
		String code = RandomHelper.getRandomString(length);
		if (type == 1) {
			code = code.toUpperCase();
		}
		RedisCacheHelper.setSessionAttribute(1, second, jobid, code);
		return code;
	}

	/**
	 * 校验验证码
	 * 
	 * @param verCode
	 * @return 核对手机验证码0正确1失败2过期
	 */
	public static int checkRandomCode(int type, String verCode, String jobid) {
		if (type == 1) {
			verCode = verCode.toUpperCase();
		}
		String code = RedisCacheHelper.removeSessionAttribute(1, jobid);
		if (code == null) {
			return 2;
		}
		if (!code.equals(verCode)) {
			return 1;
		}
		return 0;
	}

}
