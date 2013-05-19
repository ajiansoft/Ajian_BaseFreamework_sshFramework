package com.ssh.framework.dao;
import java.io.Serializable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.ssh.framework.util.page.Page;

/**   
 * BaseDAO概要说明	
 * 持久层基础类
 */
public class BaseDao extends HibernateDaoSupport{
	
	/**
	 * 插入数据对象
	 * @param obj 数据对象
	 */
	protected void insert(Object obj){
		//getSession().save(obj);
		Session ses=getSession();	
		ses.save(obj);
		ses.flush();
		ses.close();
	} 

	/**
	 * 插入数据对象,返回当前数据编号。(注意：不针对ORACLE数据库)
	 * @param obj 数据对象
	 * @return 数据编号
	 */
	protected int add(Object obj){
		Session ses=getSession();
		int id=(Integer)ses.save(obj);
		ses.flush();
		ses.close();
		return id;
	}
	
	/**
	 * 删除数据对象
	 * @param obj 数据对象
	 */
	protected void delete(Object obj){
		Session ses=getSession();
		ses.delete(obj);
		ses.flush();
		ses.close();
	}
	
	/**
	 * 根据id删除指定类型数据
	 * @param cla 类
	 * @param id 编号
	 */
	protected void delete(Class cla,Serializable id){		
		Session ses=getSession();
		Object obj=ses.get(cla, id);
		//游离状态或是自由状态(没有写到数据库中)的实例可以通过调用 merge()方法成为一个新的持久化实例(写入到数据库中)!
		//ses.merge(obj);
		ses.delete(obj);
		ses.flush();
		ses.close();
	}
	
	/**
	 * 更新数据对象
	 * @param obj 数据对象
	 */
	protected void update(Object obj){
		Session ses=getSession();
		//ses.merge(obj);
		//ses.update(obj);
		ses.saveOrUpdate(obj);
		ses.flush();
		ses.close();
	}
	
	/**
	 * 根据指定编号查询指定类型对象
	 * @param cla 类
	 * @param id 编号
	 * @return Object
	 */
	protected Object queryObj(Class cla,Serializable id){
		Session ses=getSession();	
		Object obj=ses.get(cla, id);
		ses.flush();
		ses.close();
		return obj;
	}
	
	/**
	 * HQL普通查询
	 * @param hql HQL语句
	 * @param param 参数
	 * @return List
	 */
	protected List queryHQL(String hql,List param){
		Session ses=getSession();
		Query q=ses.createQuery(hql);
		setHQLParameter(q,param);
		List list=q.list();
		ses.close();
		return list;
	}	
	
	/**
	 * HQL普通查询
	 * @param hql HQL语句
	 * @return List
	 */
	protected List queryHQL(String hql){
		Session ses=getSession();
		Query q=ses.createQuery(hql);
		List list=q.list();
		ses.close();
		return list;
	}	
	
	
	/**
	 * SQL普通查询
	 * @param sql SQL语句,要求参数完整
	 * @param entity:实体类
	 * @return List
	 */
	protected List querySQL(String sql,Class entity){
		Session ses=getSession();
		Query q=ses.createSQLQuery(sql).addEntity(entity);
		List list=q.list();
		ses.close();
		return list;
	}	
	
	/**
	 * HQL分页查询
	 * @param hql HQL语句
	 * @param param 参数
	 * @param p 分页对象
	 * @return
	 */
	protected List queryPageHQL(String hql,List param,Page page){
		Session ses=getSession();
		Query q = ses.createQuery(hql);
		//设置参数
		this.setHQLParameter(q, param);
		q.setFirstResult((page.getPageIndex()-1)*page.getPageSize());
		q.setMaxResults(page.getPageSize());
		List list = q.list();
		ses.close();
		return list;
	}
	
//	/**
//	 * HQL分页查询,可自己决定是否延迟加载
//	 * @param hql HQL语句
//	 * @param param 参数
//	 * @param p 分页对象
//	 * @param isLazy 是否延迟加载
//	 * @return
//	 */
//	@SuppressWarnings("unchecked")
//	protected List queryPageHQL(String hql,List param,Page page,Boolean isLazy){
//		if(!isLazy)queryPageHQL(hql,param,page);
//		Session ses=getSession();
//		Query q = ses.createQuery(hql);
//		//设置参数
//		this.setHQLParameter(q, param);
//		q.setFirstResult((page.getPageIndex()-1)*page.getPageNumber());
//		q.setMaxResults(page.getPageNumber());
//		List list = q.list();
//		//ses.close();
//		return list;
//	}

	/**
	 * HQL分页查询,构成sql语句如：select * from userinfo where userid in(1,2,3)
	 * @param hql HQL语句
	 * @param reason Map类型的数据，k代表占位符名称，v代表此占位符出的参数
	 * @param p 分页对象
	 * @return
	 */
	@SuppressWarnings("unchecked")
	protected List queryPageHQL2(String hql,Map<String, List> reason,Page page){//不能方法重载，因为以前代码中大量存在第二个参数为null的情况，导致程序错误
		Session ses=getSession();
		Query q = ses.createQuery(hql);
		//设置参数
		for (Iterator iter=reason.keySet().iterator();iter.hasNext();) {
			Object o = iter.next();
			q.setParameterList(o.toString(), reason.get(o));
		}
		q.setFirstResult((page.getPageIndex()-1)*page.getPageSize());
		q.setMaxResults(page.getPageSize());
		List list = q.list();
		ses.close();
		return list;
	}
	
	/**
	 * SQL分页查询
	 * @param sql sql语句
	 * @param param 参数
	 * @param p 分页对象
	 * @return
	 */
	@SuppressWarnings("unchecked")
	protected List queryPageSQL(String sql,List param,Page page){
		Session ses=getSession();
		Query q = ses.createSQLQuery(sql);
		//设置参数
		this.setHQLParameter(q, param);
		if(page!=null){
			q.setFirstResult((page.getPageIndex()-1)*page.getPageSize());
			q.setMaxResults(page.getPageSize());
		}
		List list = q.list();
		ses.close();
		return list;
	}
	
	/**
	 * 根据HQL语句执行查询，返回一个对象
	 * @param hql HQL语句
	 * @param params 参数
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Object queryHQLUniqueQuery(String hql, List param) {
		Session ses=getSession();
		Query q = ses.createQuery(hql);
		setHQLParameter(q, param);
		Object obj=q.uniqueResult();
		ses.close();
		return obj;
	}
	
	/**
	 * excuteHQL方法概要说明
	 * 执行HQL语句
	 * @param hql HQL语句
	 * @return
	 */
	protected int excuteHQL(String hql){
		Session ses=getSession();
		Query q=ses.createQuery(hql);
		int result=q.executeUpdate();
		ses.close();
		return result;
	}
	
	/**
	 * 设置HQL查询参数参数
	 * @param q 查询对象
	 * @param param 参数
	 */
	@SuppressWarnings("unchecked")
	private void setHQLParameter(Query q,List param){
		if(param!=null&&param.size()>0){
			for(int i=0;i<param.size();i++){
				q.setParameter(i, param.get(i));
			}
		}
	}

}
