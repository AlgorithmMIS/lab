package lab.bean;

public class PaperInfor {
	private String title;
	private int count;
	private String issn;
	private String publish;
	private String univ;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getIssn() {
		return issn;
	}
	public void setIssn(String issn) {
		this.issn = issn;
	}
	public String getPublish() {
		return publish;
	}
	public void setPublish(String publish) {
		this.publish = publish;
	}
	public String getUniv() {
		return univ;
	}
	public void setUniv(String univ) {
		this.univ = univ;
	}
	public String toString()
	{
       return " <tr class=\"odd gradeX\"><td>"
    		   +this.title+"</td><td>"+this.issn+"</td><td>"+this.count+"</td><td class=\"center\">" 
    		  +this.publish+"</td></tr>";
	}
}
