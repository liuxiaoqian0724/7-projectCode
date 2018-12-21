
		package com.sevenpp.qinglantutor.dao.impl;

		import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

/**
		*
		* 项目名称：qinglantutorprj
		* 类名称：ConditionsDaoImpl
		* 类描述：查询符合条件的家教老师
		* 创建人：rain
		* 创建时间：2018年12月10日 下午4:52:46
		* 修改人：rain
		* 修改时间：2018年12月10日 下午4:52:46
		* 修改备注：
		* @version
		*
		*/
		@Repository
		public class ConditionsDaoImpl {
			@Resource
			private SessionFactory sessionFactory;
			
			/**
			 * 
			 * @Title: findHql 
			 * @Description: TODO 满足所有搜索条件的sql语句
			 * @param @param grade
			 * @param @param subject
			 * @param @param department
			 * @param @param sex
			 * @param @param major
			 * @param @return    入参
			 * @return String    返回类型
			 * @author  cuishan
			 * @throws
			 * @date 2018年12月13日 上午8:53:09 
			 * @version V1.0   
			 */
			public String findSql(int grade,int subject,String department,String sex,String major) {
				String sql="select distinct a.id,username,userimg,introduce,price,teacherage from tbl_user a,tbl_myjob b,tbl_myjobgrade c,tbl_myjobcourse d "
						+ "where a.id=b.tid and b.jid=c.jid and b.jid=d.jid"+" ";
				if(grade!=0)
					sql+="and c.gid='"+grade+"'";
				if(subject!=0)
					sql+="and d.cid='"+subject+"'";
				if(!department.equals("0"))
					sql+="and a.address='"+department+"'";
				if(!sex.equals("0"))
					sql+="and a.sex='"+sex+"'";
				if(!major.equals("0"))
					sql+="and a.major='"+major+"'";
				return sql;
			}
			
			/**
			 * 
			 * @Title: findReviewStarById 
			 * @Description: TODO 根据老师id查询评价星级 
			 * @param @param id
			 * @param @return    入参
			 * @return int    返回类型
			 * @author cuishan
			 * @throws
			 * @date 2018年12月12日 上午10:52:04 
			 * @version V1.0   
			 */
			public int findReviewStarById(int id) {
				String sql="select avg(reviewStar) from tbl_review where crid in(\r\n" + 
						"		select crid from tbl_classrelation where trid in(\r\n" + 
						"				select trid from tbl_teach where tid=1\r\n" + 
						"))";
				Session session=this.sessionFactory.getCurrentSession();
				Query q=session.createSQLQuery(sql);
				float star=((Number)q.uniqueResult()).intValue();
				int star1=Math.round(star);
				return star1;
			}
			
			/**
			 * 
			 * @Title: findReviewSumById 
			 * @Description: TODO 查询此家教的评价总数 
			 * @param @param tid
			 * @param @return    入参
			 * @return int    返回类型
			 * @author cuishan
			 * @throws
			 * @date 2018年12月13日 上午10:18:37 
			 * @version V1.0   
			 */
			public int findReviewSumById(int tid) {
				Session session=this.sessionFactory.getCurrentSession();
				String sql="select count(*) from tbl_review where crid in(\r\n" + 
						"	select crid from tbl_classrelation where trid in(\r\n" + 
						"		select trid from tbl_teach where tid=?))";
				SQLQuery sq=session.createSQLQuery(sql);
				sq.setParameter(0, tid);
//				int count = (Integer)sq.list().get(0);
				int sum=((Number)sq.uniqueResult()).intValue();
				return sum;
			}

			/**
					* @Title: findReviewContentById 
					* @Description: TODO 根据老师id查出他的第一条评价
					* @param @param tid
					* @param @ret urn    入参
					* @return List    返回类型
					* @author （作者） 
					* @throws
					* @date 2018年12月14日 下午4:21:15 
					* @version V1.0   
			 */
			public String findReviewContentById(int tid) {
				Session session=this.sessionFactory.getCurrentSession();
				String sql="select reviewcontent from tbl_review where crid in( \r\n" + 
						"	select crid from tbl_classrelation where trid in(\r\n" + 
						"	select trid from tbl_teach where tid=1))";
				Query q=session.createSQLQuery(sql);
				List reviewcontents=q.list();
				String content=reviewcontents.get(0).toString();
				return content;
			}
			
			/**
			 * 
			 * @Title: findGidByGname 
			 * @Description: 根据年级名查询出对应的年级id
			 * @param @param gname
			 * @param @return    入参
			 * @return int    返回类型
			 * @author cuishan
			 * @throws
			 * @date 2018年12月11日 下午5:07:31 
			 * @version V1.0   
			 */
			public int findGidByGname(String gname) {
				Session session=this.sessionFactory.getCurrentSession();
				Query q=session.createQuery("select gid from Grade where gname=:gname");
				q.setParameter("gname", gname);
				int gid=((Number)q.uniqueResult()).intValue();
				return gid;
			}
			
			/**
			 * 
			 * @Title: findCidByCname 
			 * @Description: TODO 根据课程名查询对应的课程id
			 * @param @param cname
			 * @param @return    入参
			 * @return int    返回类型
			 * @author cuishan
			 * @throws
			 * @date 2018年12月11日 下午5:10:48 
			 * @version V1.0   
			 */
			public int findCidByCname(String cname) {
				Session session=this.sessionFactory.getCurrentSession();
				Query q=session.createQuery("select cid from Course where cname=:cname");
				q.setParameter("cname", cname);
				int cid=((Number)q.uniqueResult()).intValue();
				return cid;
			}
			
			/**
			 * 
			 * @Title: findTutorByConditions 
			 * @Description: TODO 查询符合条件的老师的user表中的相应信息
			 * @param @param grade
			 * @param @param subject
			 * @param @param department
			 * @param @param sex
			 * @param @param major
			 * @param @return    入参
			 * @return List<Object[]>    返回类型
			 * @author （作者） 
			 * @throws
			 * @date 2018年12月12日 上午11:05:50 
			 * @version V1.0   
			 */
			public List<Object[]> findTutorOnUserByConditions(int grade,int subject,String department,String sex,String major){
				Session session=this.sessionFactory.getCurrentSession();
				String Hql=this.findSql(grade, subject, department, sex, major);
				Query q=session.createQuery(Hql);
				return q.list();
			}
			
			/**
			 * 
			 * @Title: findTutorOnMyJobByConditions 
			 * @Description: TODO 查询符合所有条件的老师(顺序：id,username,userimg,introduce,price,teacherage,reviewstar,reviewsum,reviewcontent)
			 * @param @param id
			 * @param @return    入参
			 * @return List<Object[]>    返回类型
			 * @author cuishan
			 * @throws
			 * @date 2018年12月12日 下午2:46:33 
			 * @version V1.0   
			 */
			public List<Object[]> findTutorByAllConditions(int grade,int subject,String department,String sex,String major){
				String sql=this.findSql(grade, subject, department, sex, major);
				Session session=this.sessionFactory.getCurrentSession();
				Query q=session.createSQLQuery(sql);
				q.setFirstResult(0).setMaxResults(4);
//				List<Object[]> tutorlist=q.list();
				List<Object[]> tutorlist=new ArrayList<Object[]>();
				List<Object[]> tutors=new ArrayList<Object[]>();
				tutorlist=q.list();
//				//得到其他信息
				for (Object[] objects : tutorlist) {
					//得到id
					int id=(int)objects[0];
					//根据id得到星级
					int star=this.findReviewStarById(id);
					int sum=this.findReviewSumById(id);
					String content=this.findReviewContentById(id);
					
					Object[] objs=new Object[9];
					for(int i=0;i<6;i++) {
						objs[i]=objects[i];
					}
					objs[6]=star;
					objs[7]=sum;
					objs[8]=content;
					tutors.add(objs);
				}
				return tutors;
			}
			
			
			
}
