package com.ssh.framework.util.page;

import org.hibernate.Query;

import com.ssh.framework.exception.BusinessException;

public class PageUtil{
	
	private PageUtil() {}

	private static PageUtil instance = new PageUtil();

	public static PageUtil getPageUtil() {
		return instance;
	}


	/**
	 * 设置分页信息
	 * @param page：分页对象
	 * @param query：query对象
	 * @return：分页对象
	 * @throws Exception
	 */
	public Page pageSplit(Page page, Query query) throws BusinessException {
		try {
			//查看page参数是否完全,设置分页
			if(page==null){
				Query q = query;
				page = new Page(q.list().size(), 10, 1);
				q=null;
			}else{
				//查询总条数，设值
				Query q = query;
				page = new Page(q.list().size(),  page.getPageSize(), page.getPageIndex());
				q = null;
			}
			//设置分页内容
			query.setFirstResult((page.getPageIndex() - 1) * page.getPageSize());
			query.setMaxResults(page.getPageSize());
			page.setPageContent(null);
			page.setPageContent(query.list());
		} catch (Exception re) {
			throw new BusinessException(re.getMessage());
		} finally{
			query = null;
		}
		return page;
	}
	
}
