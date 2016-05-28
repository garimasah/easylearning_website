package getData;

import java.util.ArrayList;
import java.util.List;

import com.mongodb.DBCursor;

public class CollegeList {
    private String collegeName;
    private String websiteUrl;
    private String collegeAddress;
    private String collegeLogo;
    private String _id;
    private String affilatedTo;
    private String approvedBy;
    private ArrayList<String> courseName;
    private String courseUrl;
    private String contact;
    private int totalCount;
    private String estd;
    private List<String> states;
    private List<String> stream;
    private List<String> course;
    private List<String> features;
    private String collegeList;
    private DBCursor cursor;
    private String h2; 
    private List<String> ownership;
    private String metaTitle;
    private String metaDescriptions;
    private String metaKeywords;
    private String metaInfrastructure;
    private String nameOfCourse;
    private String Duration; 
    private String Eligibility; 
    private String CourseDescription; 
    private String studyMode;
    private List<CollegeList> courseNameUG;
    private List<CollegeList> courseNamePG;
    private List<String> facilities;
    
    
    
    public String getMetaTitle() {
		return metaTitle;
	}
	public void setMetaTitle(String metaTitle) {
		this.metaTitle = metaTitle;
	}
	public String getMetaDescriptions() {
		return metaDescriptions;
	}
	public void setMetaDescriptions(String metaDescriptions) {
		this.metaDescriptions = metaDescriptions;
	}
	public String getMetaKeywords() {
		return metaKeywords;
	}
	public void setMetaKeywords(String metaKeywords) {
		this.metaKeywords = metaKeywords;
	}
	public String getCollegeList() {
		return collegeList;
	}
	public void setCollegeList(String collegeList) {
		this.collegeList = collegeList;
	}
	public DBCursor getCursor() {
		return cursor;
	}
	public void setCursor(DBCursor cursor) {
		this.cursor = cursor;
	}
	public List<String> getStates() {
		return states;
	}
	public void setStates(List<String> states) {
		this.states = states;
	}
	public List<String> getStream() {
		return stream;
	}
	public void setStream(List<String> stream) {
		this.stream = stream;
	}
	public List<String> getCourse() {
		return course;
	}
	public void setCourse(List<String> course) {
		this.course = course;
	}
	public List<String> getFeatures() {
		return features;
	}
	public void setFeatures(List<String> features) {
		this.features = features;
	}
	public void setTotalCount(int totalCount){
        this.totalCount=totalCount;
    }
    public int getTotalCount(){
        return totalCount;
    }
    public void setEstd(String estd){
        this.estd=estd;
    }
    public String getEstd(){
        return estd;
    }
    public void setContact(String contact){
        this.contact=contact;
    }
    public String getContact(){
        return contact;
    }
    public void setCourseUrl(String courseUrl){
        this.courseUrl=courseUrl;
    }
    public String getCourseUrl(){
        return courseUrl;
    }
    
    public void setCollegeName(String collegeName){
        this.collegeName=collegeName;
    }
    public String getCollegeName(){
        return collegeName;
    }
    
    public void setCourseName(ArrayList<String> courseName){
        this.courseName=courseName;
    }
    public ArrayList<String> getCourseName(){
        return courseName;
    }
    
    public void setWebsiteUrl(String websiteUrl){
        this.websiteUrl=websiteUrl;
    }
    public String getWebsiteUrl(){
        return websiteUrl;
    }
    
    public void setCollegeAddress(String Collegeaddress){
        this.collegeAddress=Collegeaddress;
    }
    public String getCollegeAddress(){
        return collegeAddress;
    }
    
    public void setCollegeLogo(String collegeLogo){
        this.collegeLogo=collegeLogo;
    }
    public String getCollegeLogo(){
        return collegeLogo;
    }
    
    public void setApprovedBy(String approvedBy){
        this.approvedBy=approvedBy;
    }
    public String getApprovedBy(){
        return approvedBy;
    }
    
    public void setAffilatedTo(String affilatedTo){
        this.affilatedTo=affilatedTo;
    }
    public String getAffilatedTo(){
        return affilatedTo;
    }
    
    public void set_id(String _id){
        this._id=_id;
    }
    public String get_id(){
        return _id;
    }
	public String getH2() {
		return h2;
	}
	public void setH2(String h2) {
		this.h2 = h2;
	}
	public String getNameOfCourse() {
		return nameOfCourse;
	}
	public void setNameOfCourse(String nameOfCourse) {
		this.nameOfCourse = nameOfCourse;
	}
	public String getDuration() {
		return Duration;
	}
	public void setDuration(String duration) {
		Duration = duration;
	}
	public String getEligibility() {
		return Eligibility;
	}
	public void setEligibility(String eligibility) {
		Eligibility = eligibility;
	}
	public String getCourseDescription() {
		return CourseDescription;
	}
	public void setCourseDescription(String courseDescription) {
		CourseDescription = courseDescription;
	}
	public String getStudyMode() {
		return studyMode;
	}
	public void setStudyMode(String studyMode) {
		this.studyMode = studyMode;
	}
	public List<CollegeList> getCourseNameUG() {
		return courseNameUG;
	}
	public void setCourseNameUG(List<CollegeList> courseNameUG) {
		this.courseNameUG = courseNameUG;
	}
	public List<CollegeList> getCourseNamePG() {
		return courseNamePG;
	}
	public void setCourseNamePG(List<CollegeList> courseNamePG) {
		this.courseNamePG = courseNamePG;
	}
	public List<String> getOwnership() {
		return ownership;
	}
	public void setOwnership(List<String> ownership) {
		this.ownership = ownership;
	}
	public String getMetaInfrastructure() {
		return metaInfrastructure;
	}
	public void setMetaInfrastructure(String metaInfrastructure) {
		this.metaInfrastructure = metaInfrastructure;
	}
	public List<String> getFacilities() {
		return facilities;
	}
	public void setFacilities(List<String> facilities) {
		this.facilities = facilities;
	}
}
