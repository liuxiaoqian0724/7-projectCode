package com.sevenpp.qinglantutor.utils.AipNlp;

import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;

import com.baidu.aip.nlp.AipNlp;
import com.baidu.aip.nlp.ESimnetType;
import com.sevenpp.qinglantutor.entity.ReviewInf;

public class ReviewTrend {

		public static HashMap<ReviewInf, JSONObject>  getReviewTrend(AipNlp client,List<ReviewInf> reviewList) {
			// 传入可选参数调用接口
			HashMap<String, Object> options = new HashMap<String, Object>();
			//评论，评论返回请求json串
			HashMap<ReviewInf, JSONObject> reviewListTrend = new HashMap<ReviewInf,JSONObject>();
			for(int i=0;i<reviewList.size();i++) {
				JSONObject response = client.commentTag(reviewList.get(i).getReivewContent(), ESimnetType.EDU,options);
				reviewListTrend.put(reviewList.get(i),response);
				System.out.println(reviewListTrend.get(reviewList.get(i)));
			}
			return reviewListTrend;	
		}
}