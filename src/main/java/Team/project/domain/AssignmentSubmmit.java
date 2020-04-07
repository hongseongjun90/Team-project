package Team.project.domain;

import java.io.Serializable;
import java.sql.Date;

public class AssignmentSubmmit implements Serializable{
  private static final long serialVersionUID = 1L;
  private int memberNo;
  private int assignmentNo;
  private String file;
  private int score;
  private String content;
  private String feedback;
  private Date createDate;

  public int getMember_no() {
    return memberNo;
  }
  public void setMember_no(int member_no) {
    this.memberNo = member_no;
  }
  public int getAssignment_no() {
    return assignmentNo;
  }
  public void setAssignment_no(int assignment_no) {
    this.assignmentNo = assignment_no;
  }
  public String getFile() {
    return file;
  }
  public void setFile(String file) {
    this.file = file;
  }
  public int getScore() {
    return score;
  }
  public void setScore(int score) {
    this.score = score;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getFeedback() {
    return feedback;
  }
  public void setFeedback(String feedback) {
    this.feedback = feedback;
  }
  public Date getCreate_date() {
    return createDate;
  }
  public void setCreate_date(Date create_date) {
    this.createDate = create_date;
  }
}
