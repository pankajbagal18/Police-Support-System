package General;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

import com.mysql.jdbc.CallableStatement;
import applications.ApplicationData;
import signup.Signupdata;


@MultipartConfig(maxFileSize = 16177215)
public class QueryLayer {
	MyConnection mcon = null;
	Connection con = null;
	PreparedStatement pst = null;
	String Userdatabase="police";
	public QueryLayer() {
		// TODO Auto-generated constructor stub
	}
	
	
	public void insertUser(Signupdata data)throws SQLException {
		String sql = "{CALL insertUser(?,?,?,?,?,?,?,?)}";
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		CallableStatement cst = (CallableStatement) con.prepareCall(sql);
		cst.setString(1, data.getAadhar());
		cst.setString(2, data.getName());
		cst.setString(3, data.getCon_no());
		cst.setString(4, data.getAddress());
		cst.setString(5, data.getEmail());
		cst.setString(6, data.getGender());
		cst.setBinaryStream(7, data.getPhotoStream(), data.getPhotoSize());
		cst.setString(8, data.getPassword());
		cst.executeUpdate();
	}
	
	public boolean insertRecord(Signupdata data) throws SQLException {
		String insertQuery = "INSERT INTO userRecords VALUES(?,?,?,?,?,?,?)";
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		PreparedStatement pst = con.prepareStatement(insertQuery);
		pst.setString(1, data.getAadhar());
		pst.setString(2, data.getName());
		pst.setString(3, data.getCon_no());
		pst.setString(4, data.getAddress());
		pst.setString(5, data.getEmail());
		pst.setString(6, data.getGender());
		pst.setBinaryStream(7, data.getPhotoStream(), data.getPhotoSize());
		int state = pst.executeUpdate();
		if(state==0)
			return false;
		else
			return true;
	}
	public Signupdata getUserProfile(String aadhar)throws SQLException {
		Signupdata data = new Signupdata();
		String sql = "SELECT * FROM userRecords WHERE aadhar=?";
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, aadhar);
		ResultSet res = pst.executeQuery();
		if(res.next()) {
			data.setAadhar(aadhar);
			data.setName(res.getString("name"));
			data.setAddress(res.getString("address"));
			data.setCon_no(res.getString("con_no"));
			data.setEmail(res.getString("email"));
			data.setGender(res.getString("gender"));
			data.setPhotoStream(res.getBinaryStream("photo"));
		}
		else
			data=null;
		return data;
	}
	public boolean checkLogin(String aadhar,String password) throws SQLException {
		boolean state = false;
		String sql = "SELECT * FROM login WHERE (aadhar=?)AND(password=password(?))";
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, aadhar);
		pst.setString(2, password);
		System.out.println(password);
		ResultSet res = pst.executeQuery();
		if(res.next())
			state = true;
		else
			state = false;
		return state;
	}
	
	public void updateNotiReadBit(String appId) throws SQLException{
		String sql = "UPDATE appointment SET readbit=1 WHERE appId==?";
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, appId);
		pst.executeUpdate();
	}
	public Blob getPhotoBlob(String aadhar) throws SQLException {
		Blob image=null;
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		String sql = "SELECT photo FROM userRecords WHERE aadhar=?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1, aadhar);
		ResultSet res = pst.executeQuery();
		if(res.next())
		{
			image = res.getBlob(1);
		}
		return image;
	}
	
	public int insertFir(Firdata data) throws SQLException {
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		String sql = "INSERT INTO public_firr values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setInt(1, Integer.parseInt(data.getFirno()));
		pst.setString(2, data.getDist());
		pst.setString(3, data.getPolstation());
		pst.setString(4, data.getDate());
		pst.setString(5, data.getFirno());
		pst.setString(6, data.getSystime());
		pst.setString(7, data.getRealtime());
		pst.setString(8, data.getActs());
		pst.setString(9, data.getSect());
		pst.setString(10, data.getComname());
		pst.setString(11, data.getFatname());
		pst.setString(12, data.getDob());
		pst.setString(13, data.getUidno());
		pst.setInt(14, Integer.parseInt(data.getPassno()));
		pst.setString(15, data.getDoi());
		pst.setString(16, data.getCuradd());
		pst.setString(17, data.getPeradd());
		pst.setString(18, data.getAname());
		pst.setString(19, data.getAlias());
		pst.setString(20, data.getRname());
		pst.setString(21, data.getAcuradd());
		pst.setString(22, data.getFir());
		//ResultSet res = pst.executeUpdate();
		
		int res = pst.executeUpdate();
		return res;
	
	}
	
	
	public void insertApplication(ApplicationData data) throws SQLException {
		// TODO Auto-generated method stub
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		String sql1  = "INSERT INTO applicationRecord(appId,aadhar,type,description,Date) VALUES(?,?,?,?,?)";
		pst = con.prepareStatement(sql1);
		pst.setString(1, data.getAppId());
		pst.setString(2, data.getAadhar());
		pst.setString(3, data.getType());
		pst.setString(4, data.getDesc());
		long millis=System.currentTimeMillis(); 
		java.sql.Date date=new java.sql.Date(millis);;
		pst.setDate(5,date);
		int state = pst.executeUpdate();
		if(state!=0) {
			String sql2 = "INSERT INTO attachments(appId,attachment) VALUES(?,?)";
			pst = con.prepareStatement(sql2);getClass();
			for(Part p:data.getParts()) {
				pst.setString(1, data.getAppId());
				try {
					InputStream i = p.getInputStream();
					pst.setBinaryStream(2, i);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				state = pst.executeUpdate();
				if(state==0)
					break;
			}
		}
			
	}

	public ApplicationData[] getApplication(String aadhar) throws SQLException {
		
		String sql = "SELECT * FROM applicationRecord WHERE aadhar=?";
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, aadhar);
		ResultSet res = pst.executeQuery();
		
		ApplicationData[] data=null;
		if(res.next())
		{
			res.last();
			data=new ApplicationData[res.getRow()];
			res.first();
			int i=0;
			do{
				data[i] = new ApplicationData();
				data[i].setAadhar(aadhar);
				data[i].setAppId(res.getString("appid"));
				data[i].setDate(res.getDate("Date").toString());
				data[i].setType(res.getString("type"));
				data[i].setDesc(res.getString("description"));
				data[i].setProgress(res.getInt("progress"));
				i++;
			}while(res.next());
		}
		else {
			data=null;
		}
		return data;
	}

	public ResultSet getApplicationAck(String appId,String aadhar) throws SQLException {
		ResultSet res=null;
		String sql = "CREATE TABLE IF NOT EXISTS temp LIKE userRecords";
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		pst = con.prepareStatement(sql);
		pst.executeUpdate();
		String sql1 = "CREATE TABLE IF NOT EXISTS temp LIKE userRecords";
		pst = con.prepareStatement(sql1);
		pst.executeUpdate();
		String sql2 = "INSERT temp SELECT * FROM userRecords";
		pst = con.prepareStatement(sql2);
		pst.executeUpdate();
		String sql3 = "alter table temp drop column photo";
		pst = con.prepareStatement(sql3);
		pst.executeUpdate();
		String sql4 = "SELECT * FROM temp t JOIN applicationRecord a USING (aadhar)WHERE (t.aadhar=?)AND(appId=?)";
		pst = con.prepareStatement(sql4);
		pst.setString(1, aadhar);
		pst.setString(2, appId);
		res = pst.executeQuery();
		String sql5 = "DROP TABLE temp";
		pst = con.prepareStatement(sql5);
		pst.executeUpdate();
		return res;
	}
	
	public ResultSet getAllApplication() throws SQLException{
		ResultSet res = null;
		String sql = "SELECT appId,aadhar,name,type,Date,progress FROM applicationRecord JOIN userRecords USING(aadhar)";
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		pst = con.prepareStatement(sql);
		res = pst.executeQuery();
		return res;
	}
	
	
	public Blob getBlob(String appId,int docNo) throws SQLException {
		Blob pdfBlob=null;
		String sql = "SELECT attachment FROM attachments WHERE appId=? LIMIT ?,1";
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, appId);
		pst.setInt(2, docNo-1);
		ResultSet res = pst.executeQuery();
		if(res.next()) {
			pdfBlob = res.getBlob("attachment");
		}
		return pdfBlob;
	}
	public void sendMSG(String towhom, String fromwhom, String appId, int messageid, String msg) throws SQLException {
		// TODO Auto-generated method stub
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		String sql = "INSERT INTO message(appId,frm,towhom,message) VALUES (?,?,?,?)";
		pst = con.prepareStatement(sql);
		pst.setString(1, appId);
		pst.setString(2, fromwhom);
		pst.setString(3, towhom);
		pst.setString(4, msg);
		pst.executeUpdate();
	}
	public ResultSet getMsgIfAny(String aadhar) throws SQLException {
		String sql = "SELECT * FROM message WHERE (towhom=?) group by id desc";
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, aadhar);
		ResultSet res = pst.executeQuery();
		return res;
	}
	public void sendStatus(String appId, int status) throws SQLException {
		// TODO Auto-generated method stub
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		String sql = "UPDATE applicationRecord SET progress=? WHERE appId=?";
		pst = con.prepareStatement(sql);
		pst.setInt(1, status);
		pst.setString(2, appId);
		pst.executeUpdate();
	}
		
	public int getStatus(String appId) throws SQLException {
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		String sql = "SELECT progress FROM applicationRecord WHERE appId=?";
		pst = con.prepareStatement(sql);
		pst.setString(1, appId);
		ResultSet res = pst.executeQuery();
		int status=0;
		if(res.next())
			status = res.getInt("progress");
		else
			status = 0;
		return status;
	}
	
	public ResultSet getLocations() throws SQLException {
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		String sql = "SELECT * from location";
		pst = con.prepareStatement(sql);
		ResultSet res = pst.executeQuery();
		return res;
	}


	public ResultSet getAddress(int min) throws SQLException {
		// TODO Auto-generated method stub
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		String sql = "SELECT * from location WHERE id=?";
		pst = con.prepareStatement(sql);
		pst.setInt(1, min);
		ResultSet res = pst.executeQuery();
		return res;
	}
	
	public int[] getMessageCount(String aadhar) throws SQLException {
		int[] count=new int[3];
		String sql = "SELECT COUNT(*) FROM message WHERE (towhom=?)AND(readbit=?)";
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, aadhar);
		pst.setInt(2, 0);
		ResultSet res = pst.executeQuery();
		if(res.next())
			count[0] = res.getInt(1);
		pst.setString(1, aadhar);
		pst.setInt(2, 1);
		res = pst.executeQuery();
		if(res.next())
			count[1] = res.getInt(1);
		count[2] = count[0]+count[1];
		return count;
	}
	public void updateReadCount(String msg) throws SQLException {
		String sql = "UPDATE message SET readbit=1 WHERE message=?";
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, msg);
		pst.executeUpdate();
	}
	
	public void makeAppointment(String appId,String msg,String date) throws SQLException {
		String sql = "INSERT INTO appointment(appId,dateOfApp) VALUES(?,?)";
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, appId);
		pst.setString(2, date);
		pst.executeUpdate();
	}
	
	public int getAppointmnetCount(String aadhar) throws SQLException{
		int count=0;
		String sql = "SELECT COUNT(appId) from appointment a JOIN applicationRecord app USING(appId) where a.readbit=0;";
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		pst = con.prepareStatement(sql);
		ResultSet res = pst.executeQuery();
		if(res.next())
			count=res.getInt(1);
		return count;
	}
	
	public ResultSet getAppointments(String aadhar) throws SQLException {
		String sql = "SELECT * FROM appointment a JOIN applicationRecord app USING(appId) WHERE app.aadhar=?";
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, aadhar);
		ResultSet res = pst.executeQuery();
		return res;
	}
		
	public ResultSet getAppointment(String aadhar,String appId) throws SQLException {
		String sql = "SELECT * FROM appointment a JOIN applicationRecord app USING(appId) WHERE (app.aadhar=?)AND(app.appId=?)";
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, aadhar);
		pst.setString(2, appId);
		ResultSet res = pst.executeQuery();
		return res;
	}
	
	public int sendEmergencyComplaint(String no,String address,String lat,String lang) throws SQLException {
		String sql = "INSERT INTO emergencyComplaint(phone_no,address,lat,lang) VALUES(?,?,?,?)";
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, no);
		pst.setString(2, address);
		pst.setString(3, lat);
		pst.setString(4, lang);
		int state = pst.executeUpdate();
		return state;
	}
	
	public int sendLocation(String lat,String lang) throws SQLException {
		String sql = "INSERT INTO location(lat,long) VALUES(?,?)";
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, lat);
		pst.setString(2, lang);
		int state = pst.executeUpdate();
		return state;
	}
	public void sendWelcomeMessage(String aadhar) throws SQLException {
		String sql = "INSERT INTO message(message,frm,towhom,readbit) VALUES(?,?,?,?)";
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, "Welcome to our Community");
		pst.setString(2, "123456789123");
		pst.setString(3, aadhar);
		pst.setInt(4, 0);
		pst.executeUpdate();
	}
	public ResultSet getEmeregencyIfAny() throws SQLException{
		ResultSet res = null;
		String sql = "SELECT * FROM emergencyComplaint WHERE attended=? group by id desc";
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		
		pst = con.prepareStatement(sql);
		pst.setInt(1, 0);
		res = pst.executeQuery();
		return res;
	}
	public ResultSet getEmergencyAddress(int id) throws SQLException {
		String sql = "SELECT * FROM emergencyComplaint WHERE id=?";
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		pst = con.prepareStatement(sql);
		pst.setInt(1, id);
		ResultSet res =pst.executeQuery();
		return res;
	}
	public int[] getEmergencyCount() throws SQLException {
		String sql = "SELECT COUNT(id) FROM emergencyComplaint WHERE attended=0";
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		int[] count = new int[3];
		pst = con.prepareStatement(sql);
		ResultSet res = pst.executeQuery();
		if(res.next())
			count[0] = res.getInt(1);
		sql = "SELECT COUNT(id) FROM emergencyComplaint WHERE attended=1";
		pst = con.prepareStatement(sql);
		res = pst.executeQuery();
		if(res.next())
			count[1] = res.getInt(1);
		sql = "SELECT COUNT(id) FROM emergencyComplaint";
		pst = con.prepareStatement(sql);
		res = pst.executeQuery();
		if(res.next())
			count[2] = res.getInt(1);
		return count;
	}
	public void emergencyAttended(int id) throws SQLException {
		String sql = "UPDATE emergencyComplaint SET attended=1 WHERE id=?";
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		pst = con.prepareStatement(sql);
		pst.setInt(1, id);
		pst.executeUpdate();
	}
	public ResultSet getPublicFirs() throws SQLException {
		String sql = "SELECT id,description,dateOfIssue,name,aadhar FROM public_firr";
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		pst = con.prepareStatement(sql);
		ResultSet res = pst.executeQuery();
		return res;
	}
	public ResultSet getFIR(String id) throws SQLException {
		String sql = "SELECT * FROM public_firr WHERE id=?";
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		pst = con.prepareStatement(sql);
		pst.setInt(1, Integer.parseInt(id));
		ResultSet res = pst.executeQuery();
		return res;
	}
	
	public ResultSet getAppointment(String appId) throws SQLException {
		String sql = "SELECT * FROM appointment WHERE appId=? and attended=0";
		mcon = new MyConnection(Userdatabase);
		con = mcon.getMyConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, appId);
		ResultSet res = pst.executeQuery();
		return res;
	}

public int[] getFirCount() throws SQLException {
	int[] count = new int[12];
	int i;
	String sql = "SELECT count(dateOfIncidence) FROM appointment WHERE MONTH(dateOfIncidence)=? and YEAR(dateOfIncidence)='2016'";
	mcon = new MyConnection(Userdatabase);
	con = mcon.getMyConnection();
	pst = con.prepareStatement(sql);
	for(i=1;i<13;i++)
	{
	pst.setInt(1, i);
	ResultSet rs = pst.executeQuery();
	if(rs.next())
	{
	count[i-1]=rs.getInt(1);
	}
	System.out.println("count :- "+count[i]);
	}
	return count;
}

public ResultSet getLaws() throws SQLException {
	String sql = "SELECT * FROM law";
	mcon = new MyConnection(Userdatabase);
	con = mcon.getMyConnection();
	pst = con.prepareStatement(sql);
	ResultSet res = pst.executeQuery();
	return res;
}
public String getFailure(String aadhar) throws SQLException {
	String sql = "SELECT aadhar FROM login WHERE aadhar=?";
	mcon = new MyConnection(Userdatabase);
	con = mcon.getMyConnection();
	pst = con.prepareStatement(sql);
	pst.setString(1, aadhar);
	ResultSet res = pst.executeQuery();
	if(res.next())
	{
		return "password";
	}
	else
	{
		return "both";
	}
}


public String getContactNumber(String aadhar) throws SQLException {
	// TODO Auto-generated method stub
	String sql = "SELECT con_no FROM userRecords WHERE aadhar=?";
	mcon = new MyConnection(Userdatabase);
	con = mcon.getMyConnection();
	pst = con.prepareStatement(sql);
	pst.setString(1, aadhar);
	ResultSet res = pst.executeQuery();
	if(res.next())
	{
		return res.getString(1);
	}
	else
	{
		return null;
	}
}

public int changePassword(String aadhar,String password) throws SQLException {
	int state=0;
	String sql = "UPDATE login SET password=password(?) WHERE aadhar=?";
	mcon = new MyConnection(Userdatabase);
	con = mcon.getMyConnection();
	pst = con.prepareStatement(sql);
	pst.setString(1, password);
	pst.setString(2,aadhar);
	System.out.println(aadhar);
	state = pst.executeUpdate();
	if(state>0)
		System.out.println("Success");
	else
		System.out.println("Failed");
	return state;
}


public void bePoliceFriend(String aadhar) throws SQLException {
	// TODO Auto-generated method stub
	String  sql = "UPDATE userRecords SET frdbit=1 WHERE aadhar=?";
	mcon = new MyConnection(Userdatabase);
	con = mcon.getMyConnection();
	pst = con.prepareStatement(sql);
	pst.setString(1, aadhar);
	pst.executeUpdate();
}

public int[] appCount() throws SQLException {
	int[] count=new int[3];
	String sql = "select count(*) from applicationRecord where progress<100";
	mcon = new MyConnection(Userdatabase);
	con = mcon.getMyConnection();
	pst = con.prepareStatement(sql);
	ResultSet rs=pst.executeQuery();
	if(rs.next())
		count[0]=rs.getInt(1);
	String sql1 = "select count(*) from applicationRecord where progress=100";
	pst = con.prepareStatement(sql1);
	ResultSet rs1=pst.executeQuery();
	if(rs1.next())
		count[1]=rs1.getInt(1);
	String sql2 = "select count(*) from applicationRecord";
	pst = con.prepareStatement(sql2);
	ResultSet rs2=pst.executeQuery();
	if(rs2.next())
		count[2]=rs2.getInt(1);
	
	return count;
}

public int[] areaCount() throws SQLException {
	int[] count=new int[7];
	int i=0;
	String sql = "select count(*) from public_firr where area=?";
	mcon = new MyConnection(Userdatabase);
	con = mcon.getMyConnection();
	pst = con.prepareStatement(sql);
	String[] arr={"PCMC","Dhanakawadi","Swargate","Katraj","Kothrud","Pune_Station","Shivajinagar"};
	for(String s:arr) {
		pst.setString(1, s);
		ResultSet rs=pst.executeQuery();
		if(rs.next())
		{
		count[i]=rs.getInt(1);
		i++;
		}
	}
	
	return count;
}

public ResultSet appCount1() throws SQLException {
	String sql = "select type,count(*) from applicationRecord where progress<100 group by type";
	mcon = new MyConnection(Userdatabase);
	con = mcon.getMyConnection();
	pst = con.prepareStatement(sql);
	ResultSet rs=pst.executeQuery();
	return rs;
}
public int firCount() throws SQLException {
	int count=0;
	String sql = "select count(*) from public_firr";
	mcon = new MyConnection(Userdatabase);
	con = mcon.getMyConnection();
	pst = con.prepareStatement(sql);
	ResultSet rs=pst.executeQuery();
	if(rs.next())
	count=rs.getInt(1);
	
	return count;
}

public ResultSet appCount2() throws SQLException {
	String sql = "select type,count(*) from applicationRecord group by type";
	mcon = new MyConnection(Userdatabase);
	con = mcon.getMyConnection();
	pst = con.prepareStatement(sql);
	ResultSet rs=pst.executeQuery();
	return rs;
}

public ResultSet appCount3() throws SQLException {
	String sql = "select type,count(*) from applicationRecord where progress=100 group by type";
	mcon = new MyConnection(Userdatabase);
	con = mcon.getMyConnection();
	pst = con.prepareStatement(sql);
	ResultSet rs=pst.executeQuery();
	return rs;
}

public int[] emerCount() throws SQLException {
	int[] count=new int[3];
	String sql = "select count(*) from emergencyComplaint";
	mcon = new MyConnection(Userdatabase);
	con = mcon.getMyConnection();
	pst = con.prepareStatement(sql);
	ResultSet rs=pst.executeQuery();
	if(rs.next())
		count[0]=rs.getInt(1);
	
	String sql1 = "select count(*) from emergencyComplaint where attended=1";
	pst = con.prepareStatement(sql1);
	ResultSet rs1=pst.executeQuery();
	if(rs1.next())
		count[1]=rs1.getInt(1);
	
	String sql2 = "select count(*) from emergencyComplaint where attended=0";
	pst = con.prepareStatement(sql2);
	ResultSet rs2=pst.executeQuery();
	if(rs2.next())
		count[2]=rs2.getInt(1);
	return count;
}

public int[] method() throws SQLException {
	int[] count = new int[12];
	String sql = "SELECT count(dateOfIncidence) FROM public_firr WHERE MONTH(dateOfIncidence)='?' and YEAR(dateOfIncidence)='2017'";
	mcon = new MyConnection(Userdatabase);
	con = mcon.getMyConnection();
	pst = con.prepareStatement(sql);
	for(int i=1;i<13;i++) {
		pst.setInt(1, i);
		ResultSet res = pst.executeQuery();
		res.next();
		count[i-1] = res.getInt(1);
	}
	return count;
}
}
