package com.sevenpp.qinglantutor.dao;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.sevenpp.qinglantutor.entity.ClassRelation;
import com.sevenpp.qinglantutor.entity.Course;
import com.sevenpp.qinglantutor.entity.HomeWork;
import com.sevenpp.qinglantutor.entity.TeachRelation;
import com.sevenpp.qinglantutor.entity.User;

/**
*
* 项目名称：qinglantutorprj
* 类名称：StuCourseDao
* 类描述：查找学生，我的课程的数据
* 创建人：rain
* 创建时间：2018年12月10日 上午9:18:47
* 修改人：rain
* 修改时间：2018年12月10日 上午9:18:47
* 修改备注：
* @version
*
*/
	
public interface CourseDao {
	/**
	 * 
			* @Title: getUserByEmail 
			* @Description: 根据邮箱查用户
			* @param @param email
			* @param @return    入参
			* @return User    返回类型
			* @author （作者） 
			* @throws
			* @date 2018年12月10日 上午10:41:02 
			* @version V1.0   
	 */
	public User getUserByEmail(String email);
	
	/**
	 * 
			* @Title: getClassRelationByCrid 
			* @Description: 课程反馈按钮中，根据返回的上课关系表的id，得到classRelation方便插入评价
			* @param @param crid
			* @param @return    入参
			* @return ClassRelation    返回类型
			* @author （作者） 
			* @throws
			* @date 2018年12月12日 上午10:12:42 
			* @version V1.0   
	 */
	public ClassRelation getClassRelationByCrid(Integer crid);
	
	/**
	 * 
			* @Title: insertReview 
			* @Description: 插入评论
			* @param @param reviewTime
			* @param @param reviewContent
			* @param @param reviewStar
			* @param @param classRelation    入参
			* @return void    返回类型
			* @author （作者） 
			* @throws
			* @date 2018年12月12日 上午10:18:29 
			* @version V1.0   
	 */
	public void insertReview(Timestamp reviewTime, String reviewContent, Integer reviewStar,ClassRelation classRelation);
	
	/**
	 * 
			* @Title: changeCourseTime 
			* @Description: 	更新课程时间
			* @param @param startTime
			* @param @param endTime
			* @param @param trid    入参
			* @return void    返回类型
			* @author （作者） 
			* @throws
			* @date 2018年12月12日 下午6:27:18 
			* @version V1.0   
	 */
	public void changeCourseTime(String startTime,String endTime,Integer trid);
	
	/**
	 * 
			* @Title: insertHomework 
			* @Description: 	老师颁布作业，插入作业表
			* @param @param deadlineTime
			* @param @param tcontent
			* @param @param classRelation
			* @param @param teachRelation    入参
			* @return void    返回类型
			* @author （作者） 
			* @throws
			* @date 2018年12月13日 下午8:32:28 
			* @version V1.0   
	 */
	public void insertHomework(Date deadlineTime,String tcontent,ClassRelation classRelation,TeachRelation teachRelation);
}

	