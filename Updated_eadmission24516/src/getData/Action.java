package getData;

import java.util.List;
import com.MyConnection;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.Mongo;
import com.mongodb.util.JSON;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

public class Action {
	Mongo mongo;
	
	/*
	 * Get Distinct List Of all colleges for in homepage 
	 */
	public String getAllColleges(){
		String response="[]";
		try{
            mongo=MyConnection.getConnection();
            DB db=mongo.getDB("careers360");
            DBCollection dbCol=db.getCollection("collegeDetails");
            List cu=dbCol.distinct("collegeName");
            response=cu.toString();
  		}catch(Exception e){
		e.printStackTrace();
		}finally {
			MyConnection.closeConnection(mongo);
		}
		return response;
	}
	
	/*
	 * Get Distinct List of all state for engineering colleges
	 */
	public List<String> getEngineeringFacilityList(BasicDBObject bd){
          List<String> list=new ArrayList<String>();
          try{
        	  mongo=MyConnection.getConnection();
              DB db=mongo.getDB("careers360");
              DBCollection dbCol=db.getCollection("collegeDetails");
              list=dbCol.distinct("collegeFacilities",bd);
              Collections.sort(list);
    		}catch(Exception e){
			e.printStackTrace();
		}finally {
			MyConnection.closeConnection(mongo);
		}
		return list;
	}
	public List<String> getEngineeringOwnershipList(BasicDBObject bd){
        List<String> list=new ArrayList<String>();
        try{
      	  mongo=MyConnection.getConnection();
            DB db=mongo.getDB("careers360");
            DBCollection dbCol=db.getCollection("collegeDetails");
            list=dbCol.distinct("Ownsership",bd);
            Collections.sort(list);
  		}catch(Exception e){
			e.printStackTrace();
		}finally {
			MyConnection.closeConnection(mongo);
		}
		return list;
	}
	
	public List<String> getEngineeringStateList(BasicDBObject bd){
        List<String> list=new ArrayList<String>();
        try{
      	  mongo=MyConnection.getConnection();
            DB db=mongo.getDB("careers360");
            DBCollection dbCol=db.getCollection("collegeDetails");
            list=dbCol.distinct("state",bd);
            Collections.sort(list);
  		}catch(Exception e){
			e.printStackTrace();
		}finally {
			MyConnection.closeConnection(mongo);
		}
		return list;
	}
	
	public List<String> getEngineeringOwnership(BasicDBObject bd){
        List<String> list=new ArrayList<String>();
        try{
      	  mongo=MyConnection.getConnection();
            DB db=mongo.getDB("careers360");
            DBCollection dbCol=db.getCollection("collegeDetails");
            list=dbCol.distinct("Ownsership",bd);
            Collections.sort(list);
  		}catch(Exception e){
			e.printStackTrace();
		}finally {
			MyConnection.closeConnection(mongo);
		}
		return list;
	}
	
	/*
	 * Get Distinct List of all Stream for engineering colleges
	 */
	public List<String> getEngineeringStreamList(BasicDBObject bd,String type){
        List<String> list=new ArrayList<String>();
        try{
      	  mongo=MyConnection.getConnection();
            DB db=mongo.getDB("careers360");
            DBCollection dbCol=db.getCollection("collegeDetails");
            if(type!=null)
            {	if(type.equals("btech"))
            		list=dbCol.distinct("CoursesOffered.UG.CourseName",bd);
            	else if(type.equals("mtech"))
            		list=dbCol.distinct("CoursesOffered.PG.CourseName",bd);
            }
            else
            {
            	list=dbCol.distinct("CoursesOffered.UG.CourseName",bd);
            	list.addAll(dbCol.distinct("CoursesOffered.PG.CourseName",bd));
            }
            Collections.sort(list);
  		}catch(Exception e){
			e.printStackTrace();
		}finally {
			MyConnection.closeConnection(mongo);
		}
		return list;
	}
	
	/*
	 * Get Distinct List of all Courses for engineering colleges
	 */
	public List<String> getEngineeringCoursesList(BasicDBObject bd, String type){
        List<String> list=new ArrayList<String>();
        try{
      	  mongo=MyConnection.getConnection();
            DB db=mongo.getDB("careers360");
            DBCollection dbCol=db.getCollection("collegeDetails");
            if(type!=null)
            {	if(type.equals("btech"))
            		list=dbCol.distinct("CoursesOffered.UG.Courselevel",bd);
            	else if(type.equals("mtech"))
            		list=dbCol.distinct("CoursesOffered.PG.Courselevel",bd);
            }
            else
            {
            	list=dbCol.distinct("CoursesOffered.UG.Courselevel",bd);
            	list.addAll(dbCol.distinct("CoursesOffered.PG.Courselevel",bd));
            }
            Collections.sort(list);
  		}catch(Exception e){
			e.printStackTrace();
		}finally {
			MyConnection.closeConnection(mongo);
		}
		return list;
	}
	
	/*
	 * Get Complete College Details according to URL
	 */
	public List<CollegeList> getCollegeDetails(String collegeUrl){
        List<CollegeList> list=new ArrayList<CollegeList>();
        CollegeList c;
        CollegeList cc;
        try{
            mongo=MyConnection.getConnection();
            DB db=mongo.getDB("careers360");
            DBCollection dbCol=db.getCollection("collegeDetails");
            BasicDBObject bd=new BasicDBObject();
            BasicDBObject bd1=new BasicDBObject();
            bd1.put("college_URL",collegeUrl);
            bd.put("websiteURL", 1);
            bd.put("collegeName", 1);
            bd.put("collegeAddress", 1);
            bd.put("approved_By", 1);
            bd.put("Affilated_to", 1);
            bd.put("collegeLogo", 1);
            bd.put("CoursesOffered", 1); 
            bd.put("contact", 1); 
            bd.put("Estd", 1);  
            bd.put("collegeFacilities", 1);
            DBCursor cu=dbCol.find(bd1,bd);
            while(cu.hasNext())
            { 
                c=new CollegeList();
                ArrayList<CollegeList> as=new ArrayList<CollegeList>();
                ArrayList<CollegeList> as1=new ArrayList<CollegeList>();
                ArrayList<String> facilities=new ArrayList<String>();
                BasicDBObject dbo=(BasicDBObject)cu.next();

                c.setCollegeName(dbo.getString("collegeName"));
                c.setWebsiteUrl(dbo.getString("websiteURL"));
                c.setCollegeAddress(dbo.getString("collegeAddress"));
                c.setApprovedBy(dbo.getString("approved_By"));
                c.setAffilatedTo(dbo.getString("Affilated_to"));
                c.setCollegeLogo(dbo.getString("collegeLogo"));
                c.setContact(dbo.getString("contact"));  
                
           	 BasicDBList faci=(BasicDBList)JSON.parse(dbo.getString("collegeFacilities"));
             if(faci.size()!=0){
             	for(int i=0;i<faci.size();i++){
             		facilities.add(faci.get(i).toString());
             	}
             	
             }
             c.setFacilities(facilities);
             
                BasicDBObject dbo1=(BasicDBObject) JSON.parse(dbo.getString("CoursesOffered"));
                if(dbo1.getString("UG")!=null){                        
                    BasicDBList UG=(BasicDBList)JSON.parse(dbo1.getString("UG"));
                    if(UG.size()!=0)
                    {
                    	BasicDBObject  dbo2=null;
                        for(int i=0;i<UG.size();i++){
                        	cc=new CollegeList();
                                dbo2=(BasicDBObject) JSON.parse(UG.get(i).toString());
                                cc.setNameOfCourse(dbo2.getString("CourseName"));
                                cc.setDuration(dbo2.getString("Duration"));
                                cc.setEligibility(dbo2.getString("Eligibilty"));
                                cc.setCourseDescription(dbo2.getString("courseDescription"));
                                cc.setStudyMode(dbo2.getString("Studymode"));
                                as.add(cc);
                            }
                        }
                    }
                
                if(dbo1.getString("PG")!=null){                        
                    BasicDBList PG=(BasicDBList)JSON.parse(dbo1.getString("PG"));
                    if(PG.size()!=0)
                    {
                    	BasicDBObject  dbo2=null;
                        for(int i=0;i<PG.size();i++){
                        	cc=new CollegeList();
                                dbo2=(BasicDBObject) JSON.parse(PG.get(i).toString());
                                cc.setNameOfCourse(dbo2.getString("CourseName"));
                                cc.setDuration(dbo2.getString("Duration"));
                                cc.setEligibility(dbo2.getString("Eligibilty"));
                                cc.setCourseDescription(dbo2.getString("courseDescription"));
                                cc.setStudyMode(dbo2.getString("Studymode"));
                                as1.add(cc);
                            }
                        }
                    }
                                
	                if(dbo.getString("Estd")!=null && !(dbo.getString("Estd")).equals(""))
	                    c.setEstd(dbo.getString("Estd")); 
	                c.setCourseNameUG(as);
	                c.setCourseNamePG(as1);
	                
	                DBCollection coll3 = db.getCollection("metatags");
	                BasicDBObject meta = new BasicDBObject();
	                meta.put("page_H2", 1);
	                meta.put("url_Title", 1);
	                meta.put("url_Description", 1);
	                meta.put("url_Keywords", 1);
	                DBCursor cursor = coll3.find(new BasicDBObject("url_Name",collegeUrl),meta);
	                if(cursor.hasNext()) {
	               	 	dbo=(BasicDBObject)cursor.next();
	               	 	c.setH2(dbo.getString("page_H2"));
	               	 	if(dbo.getString("url_Title")!=null||!dbo.getString("url_Title").trim().equals(""))
	               	 		c.setMetaTitle(dbo.getString("url_Title"));
	               	 	else
	               	 		c.setMetaTitle("");
	               	 	if(dbo.getString("url_Description")!=null||!dbo.getString("url_Description").trim().equals(""))
	               	 		c.setMetaDescriptions(dbo.getString("url_Description"));
	               	 	else
	               	 		c.setMetaDescriptions("");
	               	 	if(dbo.getString("url_Keywords")!=null||!dbo.getString("url_Keywords").trim().equals(""))
	               	 		c.setMetaKeywords(dbo.getString("url_Keywords"));
	               	 	else
	               	 		c.setMetaKeywords("");
	               	 	
//	               	 	if(dbo.getString("url_Infrastructure")!=null||!dbo.getString("url_Infrastructure").trim().equals(""))
//	               	 		c.setMetaInfrastructure(dbo.getString("url_Infrastructure"));
//	               	 	else
//	               	 		c.setMetaInfrastructure("");
	               	 	
	               
	                }
	                list.add(c);
            }
            
            
        }catch(Exception e){
        	e.printStackTrace();
        }finally {
        	MyConnection.closeConnection(mongo);
        }
        return list;
	}
	
	/*
	 * Get Complete College List for B.Tech/M.Tech Colleges
	 */
    public List<CollegeList> getCollegeList(int from,String type,String[] filterFacility,String[] filterStream,String[] filterCourse,String[] filterState,String[] filterOwnership,String sorting,String requestedURL){
    	List<CollegeList> list=new ArrayList<CollegeList>();
    	CollegeList c=new CollegeList();
    	try{
    		mongo=MyConnection.getConnection();
            DB db=mongo.getDB("careers360");
            DBCollection dbCol=db.getCollection("collegeDetails");
            BasicDBObject bd=new BasicDBObject();
            BasicDBObject bd1 = null;
            BasicDBObject bdo = new BasicDBObject();
            if(type!=null)
            {	if(type.equals("mtech"))
            	{
            		bd1=new BasicDBObject("CoursesOffered.PG",new BasicDBObject("$exists", true));
            		if(filterStream!=null){
                      	bd1.put("CoursesOffered.PG.CourseName", new BasicDBObject("$in",filterStream));
                      	bdo.put("CoursesOffered.PG.CourseName", new BasicDBObject("$in",filterStream));
                    }
            		
            		 String subString=requestedURL.substring(requestedURL.lastIndexOf("/")+1);
                     String firstString=null;
                     if(!subString.equals("list-of-colleges"))
                     {
                     	subString=subString.replace("list-of", "").trim();
                     	subString=subString.replace("-colleges", "").trim();
                     	if(subString.contains("-in-"))
                     	{
                     		String[] multiSearch=subString.split("-in-");
                     		firstString=multiSearch[0].replace("-"," ").trim();
                     		bd1.put("state", new BasicDBObject("$regex",multiSearch[1].replace("-", " ").trim()).append("$options","i"));   
                     	}
                     	else
                     		firstString=subString.replace("-"," ").trim();
                     	if(firstString.contains("public")||firstString.contains("partnership")||firstString.contains("private"))
                     	{	
                     		boolean course=true;
                     		if(firstString.contains("public private partnership"))
                			{
                     			firstString=firstString.replace("public private partnership", "").trim();
                				bd1.put("Ownsership",  new BasicDBObject("$regex","Partnership").append("$options","i"));
                			}
                			else if(firstString.contains("public"))
                			{
                				firstString=firstString.replace("public", "").trim();
                				bd1.put("Ownsership", "Public");
                			}
                	    	else if(firstString.contains("private"))
                	    	{
                	    		firstString=firstString.replace("private", "").trim();
                	    		bd1.put("Ownsership", "Private");
                	    	}
                	 		else
                	 		{	
                	 			bd1.put("CoursesOffered.PG.CourseName", new BasicDBObject("$regex",firstString).append("$options","i"));
                	 			course=false;
                	 		}
                     		
                     		if(course && !firstString.trim().equals(""))
                     			bd1.put("CoursesOffered.PG.CourseName", new BasicDBObject("$regex",firstString).append("$options","i"));
                     	}
                  		else{
                 			bd1.put("CoursesOffered.PG.CourseName", new BasicDBObject("$regex",firstString).append("$options","i"));     
                  		}
                     }
                    
            	}
            	else if(type.equals("btech"))
            	{
            		bd1=new BasicDBObject("CoursesOffered.UG",new BasicDBObject("$exists", true));
            		if(filterStream!=null){
                      	bd1.put("CoursesOffered.UG.CourseName", new BasicDBObject("$in",filterStream));
                      	bdo.put("CoursesOffered.UG.CourseName", new BasicDBObject("$in",filterStream));
                    }
            		 //Courses URl
                    String subString=requestedURL.substring(requestedURL.lastIndexOf("/")+1);
                    String firstString=null;
                    
                    if(!subString.equals("list-of-colleges"))
                    {
                    	subString=subString.replace("list-of", "").trim();
                    	subString=subString.replace("-colleges", "").trim();
                    	if(subString.contains("-in-"))
                    	{
                    		String[] multiSearch=subString.split("-in-");
                    		firstString=multiSearch[0].replace("-"," ").trim();
                    		bd1.put("state", new BasicDBObject("$regex",multiSearch[1].replace("-", " ").trim()).append("$options","i"));   
                    	}
                    	else
                    		firstString=subString.replace("-"," ").trim();
                    	if(firstString.contains("public")||firstString.contains("partnership")||firstString.contains("private"))
                     	{	
                     		boolean course=true;
                     		if(firstString.contains("public private partnership"))
                			{
                     			firstString=firstString.replace("public private partnership", "").trim();
                				bd1.put("Ownsership",  new BasicDBObject("$regex","Partnership").append("$options","i"));
                			}
                			else if(subString.contains("public"))
                			{
                				firstString=firstString.replace("public", "").trim();
                				bd1.put("Ownsership", "Public");
                			}
                	    	else if(firstString.contains("private"))
                	    	{
                	    		firstString=firstString.replace("private", "").trim();
                	    		bd1.put("Ownsership", "Private");
                	    	}
                	 		else
                	 		{	
                	 			bd1.put("CoursesOffered.UG.CourseName", new BasicDBObject("$regex",firstString).append("$options","i"));
                	 			course=false;
                	 		}
                     		if(course && !firstString.trim().equals(""))
                     			bd1.put("CoursesOffered.UG.CourseName", new BasicDBObject("$regex",firstString).append("$options","i"));
                     	}
                  		else{
                 			bd1.put("CoursesOffered.UG.CourseName", new BasicDBObject("$regex",firstString).append("$options","i"));     
                  		}
                    }
            	}
            }
            else
            {
            	bd1=new BasicDBObject();
            	if(filterStream!=null){
                  	bd1.put("CoursesOffered.UG.CourseName", new BasicDBObject("$in",filterStream));
                  	bd1.put("CoursesOffered.PG.CourseName", new BasicDBObject("$in",filterStream));
                  	bdo.put("CoursesOffered.UG.CourseName", new BasicDBObject("$in",filterStream));
                  	bdo.put("CoursesOffered.PG.CourseName", new BasicDBObject("$in",filterStream));
                }
            	
            	 String subString=requestedURL.substring(requestedURL.lastIndexOf("/")+1);
                 String firstString=null;
                 
                 if(!subString.equals("list-of-colleges"))
                 {
                 	subString=subString.replace("list-of", "").trim();
                 	subString=subString.replace("-colleges", "").trim();
                 	if(subString.contains("-in-"))
                 	{
                 		String[] multiSearch=subString.split("-in-");
                 		firstString=multiSearch[0].replace("-"," ").trim();
                 		bd1.put("state", new BasicDBObject("$regex",multiSearch[1].replace("-", " ").trim()).append("$options","i"));   
                 	}
                 	else
                 		firstString=subString.replace("-"," ").trim();
                 	
                 	if(firstString.contains("public")||firstString.contains("partnership")||firstString.contains("private"))
                 	{	
                 		boolean course=true;
                 		if(firstString.contains("public private partnership"))
            			{
                 			firstString=firstString.replace("public private partnership", "").trim();
            				bd1.put("Ownsership",  new BasicDBObject("$regex","Partnership").append("$options","i"));
            			}
            			else if(firstString.contains("public"))
            			{
            				firstString=firstString.replace("public", "").trim();
            				bd1.put("Ownsership", "Public");
            			}
            	    	else if(firstString.contains("private"))
            	    	{
            	    		firstString=firstString.replace("private", "").trim();
            	    		bd1.put("Ownsership", "Private");
            	    	}
            	 		else
            	 		{	
            	 			bd1.put("CoursesOffered.UG.CourseName", new BasicDBObject("$regex",firstString).append("$options","i"));     
                 			bd1.put("CoursesOffered.PG.CourseName", new BasicDBObject("$regex",firstString).append("$options","i")); 
            	 			course=false;
            	 		}
                 		
                 		if(course && !firstString.trim().equals(""))
                 		{
                 			bd1.put("CoursesOffered.UG.CourseName", new BasicDBObject("$regex",firstString).append("$options","i"));     
                 			bd1.put("CoursesOffered.PG.CourseName", new BasicDBObject("$regex",firstString).append("$options","i")); 
                 		}
                 	}
              		else{
              			bd1.put("CoursesOffered.UG.CourseName", new BasicDBObject("$regex",firstString).append("$options","i"));     
             			bd1.put("CoursesOffered.PG.CourseName", new BasicDBObject("$regex",firstString).append("$options","i")); 
              		}
            	}
            }
            
            if(filterFacility!=null){
            	bd1.put("collegeFacilities", new BasicDBObject("$in",filterFacility));
            }
          
            if(filterCourse!=null){
            	bd1.put("Courselevel", new BasicDBObject("$in",filterCourse));
            }
            if(filterState!=null){
            	bd1.put("state", new BasicDBObject("$in",filterState));
            }
            if(filterOwnership!=null){
            	bd1.put("Ownsership", new BasicDBObject("$in",filterOwnership));
            }
            
            bd.put("websiteURL", 1);
            bd.put("collegeName", 1);
            bd.put("collegeAddress", 1);
            bd.put("ApprovedBy", 1);
            bd.put("Affilated_to", 1);
            bd.put("collegeLogo", 1);
            bd.put("college_URL", 1);
            bd.put("Estd", 1);
            bd.put("contact", 1);          
            
            int totalQuery=dbCol.find(bd1,bd).count();
            if(totalQuery%10==0)
            	totalQuery=totalQuery/10;
            else
            	totalQuery=(totalQuery/10)+1;
            BasicDBObject sortedOrder=new BasicDBObject();
            if(sorting.equals("alpha"))
            	sortedOrder.put("collegeName", 1);
            else
            {	
            	sortedOrder.put("User_ratings", -1);
             	sortedOrder.put("Estd", 1);
            	sortedOrder.put("Individual_Rating.Overall rating", -1);
            	sortedOrder.put("Individual_Rating.Placement", -1);
            	sortedOrder.put("Individual_Rating.Infrastructure", -1);
            	sortedOrder.put("TotalFaculty", -1);
//            	sortedOrder.put("Individual_Rating.Faculty", -1);
//            	sortedOrder.put("Individual_Rating.Affordability", -1);
            	bd1.put("Estd", new BasicDBObject("$gt",0));
            }
          
            c.setTotalCount(totalQuery);
            c.setCursor((dbCol.find(bd1,bd).limit(10).skip(from)).sort(sortedOrder));
            c.setStates(getEngineeringStateList(bdo));
            c.setOwnership(getEngineeringOwnership(bdo));
            c.setCollegeList(getAllColleges());
            c.setCourse(getEngineeringCoursesList(bdo,type));
            c.setStream(getEngineeringStreamList(bdo,type));
            c.setFeatures(getEngineeringFacilityList(bdo));
            list.add(c);
        }catch(Exception e){
			e.printStackTrace();
		}finally {
			MyConnection.closeConnection(mongo);
		}
		return list;
	}
    
    /*
     * Contact Form Entry
     */
    public String enterContact(String name,String email,String phone,String ques){
		String result="error";
		try{
			Mongo mongoClient = MyConnection.getConnection();
			DB db = mongoClient.getDB( "careers360" );
			DBCollection coll = db.getCollection("contactus_details");
			BasicDBObject js = new BasicDBObject();
			js.put("name", name);
			js.put("email",email);
			js.put("phone",phone);
			js.put("ques",ques);
			coll.insert(js);
		}
		catch(Exception e){
			System.out.println(e);
		}
         
		return result;
	} 
    
    
    public int setCookie(String ipaddress,String pageUrl){
		int result=0;
		try{
			Mongo mongoClient = MyConnection.getConnection();
			DB db = mongoClient.getDB( "careers360" );
			DBCollection coll1 = db.getCollection("collegeDetails");
			DBCollection coll = db.getCollection("cookieDetails");
			String databaseUrl=pageUrl.substring(pageUrl.lastIndexOf("/")+1);
			BasicDBObject bd = new BasicDBObject();
			bd.put("college_URL", databaseUrl);
			result=coll.find().count()+1;
			DBCursor cu=coll1.find(bd);
			if(cu.hasNext())
			{
				BasicDBObject dbo=(BasicDBObject)cu.next();
				BasicDBObject bd1 = new BasicDBObject();
				bd1.put("cookieId", result);
				bd1.put("ipAddress", ipaddress);
				bd1.put("visitedDate", new Date());
				bd1.put("visitedPages", dbo.getObjectId("_id").toString());
				coll.insert(bd);
			}else{
				BasicDBObject bd1 = new BasicDBObject();
				bd1.put("cookieId", result);
				bd1.put("ipAddress", ipaddress);
				bd1.put("visitedDate", new Date());
				bd1.put("visitedPages", databaseUrl);
				coll.insert(bd);
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
		return result;
	} 
    
    public boolean updateCookie(String ipaddress,String cookieId, String pageUrl){
		try{
			Mongo mongoClient = MyConnection.getConnection();
			DB db = mongoClient.getDB( "careers360" );
			String id=null;
			String databaseUrl=pageUrl.substring(pageUrl.lastIndexOf("/")+1);
			DBCollection coll1 = db.getCollection("collegeDetails");
			BasicDBObject bd1 = new BasicDBObject();
			bd1.put("college_URL", databaseUrl);
			DBCursor cu1=coll1.find(bd1);
			if(cu1.hasNext())
			{
				BasicDBObject dbo=(BasicDBObject)cu1.next();
				id=dbo.getObjectId("_id").toString();
			}
			int cuc=Integer.parseInt(cookieId.replace("Easyadmission", "").trim());
			DBCollection coll = db.getCollection("cookieDetails");
			BasicDBObject bd = new BasicDBObject();
			bd.put("cookieId", cuc);
			DBCursor cu=coll.find(new BasicDBObject("cookieId",cuc));
			if(cu.hasNext())
			{
				if(id!=null)
					coll.update(new BasicDBObject("cookieId",cuc), new BasicDBObject("$push",id));
				else
					coll.update(new BasicDBObject("cookieId",cuc), new BasicDBObject("$push",databaseUrl));
			}else{
				int result=coll.find().count();
				BasicDBObject bd2 = new BasicDBObject();
				bd2.put("cookieId", result+1);
				bd2.put("ipAddress", ipaddress);
				bd2.put("visitedDate", new Date());
				if(id!=null){
					bd2.put("visitedPages", id);
				}
				else{
					bd2.put("visitedPages", databaseUrl);
				}
				coll.insert(bd2);
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
         
		return true;
	} 
    
    public List<CollegeList> getCollegeList(int from,String type,String[] filterFacility,String[] filterStream,String[] filterCourse,String[] filterState, String[] filterOwnership){
    	List<CollegeList> list=new ArrayList<CollegeList>();
    	CollegeList c=new CollegeList();
    	try{
    		mongo=MyConnection.getConnection();
            DB db=mongo.getDB("careers360");
            DBCollection dbCol=db.getCollection("collegeDetails");
            BasicDBObject bd=new BasicDBObject();
            BasicDBObject bd1 = null;
            if(type!=null)
            {	if(type.equals("mtech"))
            	{
            		bd1=new BasicDBObject("CoursesOffered.PG",new BasicDBObject("$exists", true));
            		if(filterStream!=null){
                      	bd1.put("CoursesOffered.PG.CourseName", new BasicDBObject("$in",filterStream));
                    }
            	}
            	else if(type.equals("btech"))
            	{
            		bd1=new BasicDBObject("CoursesOffered.UG",new BasicDBObject("$exists", true));
            		if(filterStream!=null){
                      	bd1.put("CoursesOffered.UG.CourseName", new BasicDBObject("$in",filterStream));
                    }
            	}
            }
            else
            {
            	bd1=new BasicDBObject();
            	if(filterStream!=null){
                  	bd1.put("CoursesOffered.UG.CourseName", new BasicDBObject("$in",filterStream));
                  	bd1.put("CoursesOffered.PG.CourseName", new BasicDBObject("$in",filterStream));
                }
            }
            
            if(filterFacility!=null){
            	bd1.put("collegeFacilities", new BasicDBObject("$in",filterFacility));
            }
          
            if(filterCourse!=null){
            	bd1.put("Courselevel", new BasicDBObject("$in",filterCourse));
            }
            if(filterState!=null){
            	bd1.put("state", new BasicDBObject("$in",filterState));
            }
            if(filterOwnership!=null){
            	bd1.put("Ownsership", new BasicDBObject("$in",filterOwnership));
            }
            bd.put("websiteURL", 1);
            bd.put("collegeName", 1);
            bd.put("collegeAddress", 1);
            bd.put("ApprovedBy", 1);
            bd.put("Affilated_to", 1);
            bd.put("collegeLogo", 1);
            bd.put("college_URL", 1);
            bd.put("Estd", 1);
            bd.put("contact", 1);          
            
            int totalQuery=dbCol.find(bd1,bd).count();
            if(totalQuery%10==0)
            	totalQuery=totalQuery/10;
            else
            	totalQuery=(totalQuery/10)+1;
            c.setTotalCount(totalQuery);
            c.setCursor(dbCol.find(bd1,bd).limit(10).skip(from));
            c.setStates(getEngineeringStateList(bd1));
            c.setCollegeList(getAllColleges());
            c.setCourse(getEngineeringCoursesList(bd1,type));
            c.setStream(getEngineeringStreamList(bd1,type));
            c.setFeatures(getEngineeringFacilityList(bd1));
            c.setOwnership(getEngineeringOwnershipList(bd1));
            list.add(c);
        }catch(Exception e){
			e.printStackTrace();
		}finally {
			MyConnection.closeConnection(mongo);
		}
		return list;
	}
}
