package com.zfsoft.xgxt.base.exception;

import net.sf.json.JSONObject;

import com.zfsoft.xgxt.base.message.MessageUtil;

/**
 * 学工系统公用异常类<br>
 * 用于在处理业务逻辑时抛出的运行时间异常<br>
 * 抛出此类型异常时需要传递异常消息key,<br>
 * 消息内容请配置在property文件里，具体用法请参考构造方法
 * @author qph
 * @version 2.0
 * 日期：2013-4-16
 */
public class SystemException extends RuntimeException {

	private static final long serialVersionUID = 2386276707218879014L;
	
	private String key;//异常编号
	private String message;//异常消息

	public String getKey() {
		return key;
	}


	public SystemException(){
		super();
	}

	
	/**
	 * 传递异常消息编号<br>
	 * 自动获取在property文件里配置的异常消息<br>
	 * 不支持直接抛异常消息
	 * @param key 异常消息编号
	 */
	public SystemException(String key){
		this.key = key;
		this.message = MessageUtil.getText(key);
	}
	
	
	/**
	 * key参数的用法同以上构造方法<br>
	 * 在此基础上支持向异常消息传递参数<br>
	 * 在异常消息里的用法**{0}**,{0}就代表value参数值
	 * @param key 异常消息编号
	 * @param value 向异常消息传递的参数
	 */
	public SystemException(String key,Object value){
		this.key = key;
		this.message = MessageUtil.getText(key,value);
	}
	
	
	/**
	 * key参数的用法同以上构造方法<br>
	 * 支持向异常消息传递参数数组<br>
	 * 异常消息里的用法**{0}**{1}**，{0}{1}都是在这里传递的参数，以此类推
	 * @param key 异常消息编号
	 * @param values 向异常消息传递的参数数组
	 */
	public SystemException(String key,Object[] values){
		this.key = key;
		this.message = MessageUtil.getText(key,values);
	}


	@Override
	public String getMessage() {
		
		if (null != this.message){
			return this.message;
		}
		return super.getMessage();
	}
	
	/**
	 * 
	 * @描述 ：个性化异常消息方法
	 * @param json
	 */
	public  SystemException(JSONObject json){
		this.key = json.getString("message");
		this.message = json.getString("message");
	}
	
}
