package admin;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import General.QueryLayer;

/**
 * Servlet implementation class ShowDoc
 */
@WebServlet("/ShowDoc")
public class ShowDoc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String appId = request.getParameter("appId");
		int docNo = Integer.parseInt(request.getParameter("doc"));
		String filename = appId+"_"+docNo+".pdf";
		QueryLayer q = new QueryLayer();
		Blob pdfBlob = null;
		try {
			pdfBlob = q.getBlob(appId,docNo);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		byte data[] = null;
		try {
			data = pdfBlob.getBytes(1,(int)pdfBlob.length());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setContentType("application/pdf");
		response.setHeader("cache-control", "no-cache");
	    //response.setHeader("Content-disposition", "attachment; filename=" + filename);
	    OutputStream output = response.getOutputStream();
	    output.write(data);
	    output.flush();
	    output.close();
	}
}
