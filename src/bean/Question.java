package bean;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Question {
	public String id;
	public String title,optionA,optionB,optionC,optionD,type,trueAnswer;
	

	public Question(){
		
	}
	public Question(String id,String title,String optionA,String optionB,String optionC,String optionD,String type,String trueAnswer){
		this.id = id;
		this.title = title;
		this.optionA = optionA;
		this.optionB = optionB;
		this.optionC = optionC;
		this.optionD = optionD;
		this.trueAnswer = trueAnswer;
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getOptionA() {
		return optionA;
	}
	public void setOptionA(String optionA) {
		this.optionA = optionA;
	}
	public String getOptionB() {
		return optionB;
	}
	public void setOptionB(String optionB) {
		this.optionB = optionB;
	}
	public String getOptionC() {
		return optionC;
	}
	public void setOptionC(String optionC) {
		this.optionC = optionC;
	}
	public String getOptionD() {
		return optionD;
	}
	public void setOptionD(String optionD) {
		this.optionD = optionD;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTrueAnswer() {
		return trueAnswer;
	}
	public void setTrueAnswer(String trueAnswer) {
		this.trueAnswer = trueAnswer;
	}
	
	
	public List<Question> QList() {
		
		Question question = null;
		List<Question> questionList = new ArrayList<Question>();
		ConnectDataBase cdb = new ConnectDataBase();
		Connection conn = cdb.getConn();
		PreparedStatement pstmt1 = null;
		ResultSet rs1 = null;

		String sql1 = "select * from question";
		
		try{
			pstmt1=conn.prepareStatement(sql1);
			rs1 = pstmt1.executeQuery();
			
			while(rs1.next()){
				question = new Question();
				question.id = rs1.getString("id");
				question.title = rs1.getString("title");
				question.optionA = rs1.getString("optionA");
				question.optionB = rs1.getString("optionB");
				question.optionC = rs1.getString("optionC");
				question.optionD = rs1.getString("optionD");
				question.type = rs1.getString("type");
				question.trueAnswer = rs1.getString("trueAnswer");
				questionList.add(question);
			}
			if(rs1!=null) rs1.close();
			if(pstmt1!=null) pstmt1.close();
			if(conn!=null)	conn.close();
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return questionList;
	}
	
	
	public int getScore(String s1,String s2){
		int score=0;
		String selection="";
		String trueAnswers="";
		selection = selection + s1;
		trueAnswers = trueAnswers + s2;
		System.out.println("selection="+selection+" trueAnswers="+trueAnswers);
		
		int i = selection.length()-1;  //客户提交的第i题答案在selection中的位置
		int m = trueAnswers.length();
		//System.out.println("i="+i+"  m="+m);
		
		if(i<=m-1){
			try{
				for(int j=i;j>=0;j--){
					if(selection.charAt(j)==trueAnswers.charAt(j)){
						if(selection.charAt(j)!='\''){
							score++;
						}
					}
					//System.out.println("selection.charAt("+j+")="+selection.charAt(j));
					//System.out.println("trueAnswers.charAt("+j+")="+trueAnswers.charAt(j));
				}
			}catch(StringIndexOutOfBoundsException e){
				i=0;
				//System.out.println("i=0后：i="+i+"  m="+m);
			}
		}
		return score;
	}
	
}
