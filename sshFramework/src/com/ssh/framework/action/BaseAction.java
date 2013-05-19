package com.ssh.framework.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.framework.util.gson.GsonFieldSkipImpl;
import com.ssh.framework.util.page.Page;

public class BaseAction extends ActionSupport {
	private static final long serialVersionUID = 1L;

	private HttpServletRequest request;
	private HttpServletResponse response;
	private PrintWriter out;
	//public Page page;

	/**
	 * 响应指定数据
	 * 
	 * @param str
	 * @author Ajian
	 * @version 2012-5-10 上午11:04:09
	 */
	protected void printOut(Object obj) {
		out = this.getOut(response, out);
		out.print(obj);
		out.close();
	}

	/**
	 * 用JSON格式输出数据 适用于bean中只需要输出少量字段
	 * 
	 * @param obj
	 *            :需要转换输出的对象
	 * @param convertFields
	 *            :需要输出的字段
	 */
	protected void printByJSON(Object obj, final String[] notConvertFields) {
		if (notConvertFields == null || notConvertFields.length == 0) {
			printByJSON(obj);
		} else {
			printOut(getJSON(obj, notConvertFields));
		}
	}

	/**
	 * 用JSON格式输出数据 适用于bean中只需要输出少量字段
	 * 
	 * @param obj
	 *            :需要转换输出的对象
	 * @param convertFields
	 *            :需要输出的字段
	 */
	protected void printByJSON(Object obj) {
		printOut(new Gson().toJson(obj));
	}

	/**
	 * 转换指定对象得到json字符串
	 * 
	 * @param obj
	 *            需要转换的对象
	 * @param notConvertFields
	 *            对象中不需要转换输出的字段名称，无则为null
	 * @return 格式后的json字符串
	 * @author Ajian
	 * @version 2012-5-10 下午02:38:35
	 */
	protected String getJSON(Object obj, final String[] notConvertFields) {
		Gson gson = new GsonBuilder().setExclusionStrategies(
				new GsonFieldSkipImpl(obj.getClass(), notConvertFields))
				.create();
		return gson.toJson(obj);
	}

	/**
	 * 设置无缓存，编码格式为utf-8的io流对象
	 * @param response
	 * @param out
	 * @return
	 * @author Ajian
	 * @version 2012-5-10 上午11:00:12
	 */
	private PrintWriter getOut(HttpServletResponse response, PrintWriter out) {
		try {
			response.setHeader("Cache-Control", "no-cache");
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
		} catch (IOException e) {
		}
		return out;
	}

	protected PrintWriter getOut() {
		return out;
	}

	/*public void setPage(Page page) {
		System.out.println("baseAction setpage!");
		this.page = page;
	}

	public Page getPage() {
		return page;
	}*/

	public HttpServletRequest getRequest() {
		if(request == null){
			this.request = ServletActionContext.getRequest();
		}
		return request;
	}

	public HttpServletResponse getResponse() {
		if(response==null){
			this.response = ServletActionContext.getResponse();
		}
		return response;
	}

	/*
	 * protected void printOutByIE(String str) { response = this.getResponse();
	 * out = this.getWriter(response, out); out.print(str); out.close(); }
	 */

	/**
	 * ajax打印返回参数
	 * 
	 * @param str
	 * 
	 *            protected void printOutByIE(int str) { response =
	 *            this.getResponse(); out = this.getWriter(response, out);
	 *            out.print(str); out.close(); }
	 */

	/*
	 * private PrintWriter getWriter(HttpServletResponse response, PrintWriter
	 * out) { response.setContentType("text/html;charset=utf-8"); response =
	 * this.getResponse(); try { out = response.getWriter(); } catch
	 * (IOException e) { e.printStackTrace(); } return out; }
	 */

}
