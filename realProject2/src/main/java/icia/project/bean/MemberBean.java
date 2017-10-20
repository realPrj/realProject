package icia.project.bean;

import org.apache.ibatis.type.Alias;

@Alias("member")
public class MemberBean {

	private String caCode;	// 메뉴코드
	private String identity; // 신분
	private String studentCode; // 학생학년반번호
	private String name;	// 이름
	private String id; // 아이디
	private String pwd; // 비밀번호
	private String email; // 이메일
	private String phone; // 전화번호
	private String stGrade; // 학년
	private String stclass; // 반
	private String stNumber; // 번호
	private String stateCode;	// 상태코드
	private int logType;	// 로그 타입
	
	public String getCaCode() {
		return caCode;
	}
	public void setCaCode(String caCode) {
		this.caCode = caCode;
	}
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	public String getStudentCode() {
		return studentCode;
	}
	public void setStudentCode(String studentCode) {
		this.studentCode = studentCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getStGrade() {
		return stGrade;
	}
	public void setStGrade(String stGrade) {
		this.stGrade = stGrade;
	}
	public String getStclass() {
		return stclass;
	}
	public void setStclass(String stclass) {
		this.stclass = stclass;
	}
	public String getStNumber() {
		return stNumber;
	}
	public void setStNumber(String stNumber) {
		this.stNumber = stNumber;
	}
	public String getStateCode() {
		return stateCode;
	}
	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}
	public int getLogType() {
		return logType;
	}
	public void setLogType(int logType) {
		this.logType = logType;
	}
	
	
	

	
	

}
