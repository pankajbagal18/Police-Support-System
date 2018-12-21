package dashboard;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.portable.OutputStream;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;


/**
 * Servlet implementation class GeneratePDF
 */
@WebServlet("/GeneratePDF")
public class GeneratePDF extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			generatePDF(request,response,"test.pdf");
			System.out.println("Generating");
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	public static boolean generatePDF(HttpServletRequest request, HttpServletResponse response,String path) throws DocumentException, MalformedURLException, IOException {
		boolean state = false;
		Document document = new Document();
		FileOutputStream out = new FileOutputStream("first.pdf");
        PdfWriter writer = PdfWriter.getInstance(document, out);
        document.open();
        Font font = new Font(FontFamily.HELVETICA, 18, Font.BOLD);
        Font italic = new Font(FontFamily.TIMES_ROMAN,12,Font.ITALIC);
        Font normal = new Font(FontFamily.TIMES_ROMAN,12,Font.NORMAL);        
        
        String collegeName = "Maharashtra Police Support System\n\n";
        String collegeAddress = "Dhanakawadi Police Station Pune-411043\n"+
        				"Application Acknowledgement";
        
        Chunk para1 = new Chunk(collegeName, font);
        Chunk para2 = new Chunk(collegeAddress, italic);
        Paragraph comb=new Paragraph(); 
        comb.add(new Chunk(para1));
        comb.add(new Chunk(para2)); 

        PdfPTable table = new PdfPTable(2);
        table.setWidthPercentage(110);
        PdfPCell cell = new PdfPCell(comb);
        cell.setColspan(4);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        String IMG = "/home/panks/3906/PoliceSupport/WebContent/images/icon/mahapolice.png";
        Image img = Image.getInstance(IMG);
        
        table.addCell(new PdfPCell(img, true));
        table.addCell(cell);

    

        cell = new PdfPCell(new Phrase("Personal Details",font));
        cell.setColspan(4);
        table.addCell(cell);
        table.addCell("Aadhar NO : ");
        table.addCell("1001");
        table.addCell("Name : ");
        table.addCell("Blaine Spenser");
        table.addCell("Gender : ");
        table.addCell("2");
        table.addCell("Email : ");
        table.addCell("1");
        table.addCell("Address : ");
        table.addCell("1074");
        table.addCell("Date Of Birth : ");
        table.addCell("1046");
        table.addCell("Photo : ");
        table.addCell(img);
        cell = new PdfPCell(new Phrase("Appication Details",font));
        cell.setColspan(4);
        table.addCell(cell);
        
        cell = new PdfPCell(img,true);
        
        document.add(table);
        
        PdfPTable table2  = new PdfPTable(2);
        table2.setWidthPercentage(110);
        table2.addCell("Application Id");
        table2.addCell("1234");
        cell = new PdfPCell(new Phrase("CET"));
        cell.setColspan(1);
        table2.addCell(cell);
        cell = new PdfPCell(new Phrase("195"));
        cell.setColspan(1);
        table2.addCell(cell);
//        cell = new PdfPCell(new Phrase("100/200"));
//        cell.setColspan(1);
//        table2.addCell(cell);
        document.add(table2);
        
        
        table2 = new PdfPTable(4);
        table2.setWidthPercentage(110);
        cell = new PdfPCell(new Phrase("List of Documents Submitted : ",font));
        cell.setColspan(4);
        table2.addCell(cell);
        cell = new PdfPCell();
        cell.setColspan(1);
        cell.addElement(new Phrase("1."));
        table2.addCell(cell);
        cell = new PdfPCell();
        cell.setColspan(3);
        cell.addElement(new Phrase("Addmission Letter of College"));
        table2.addCell(cell);
        cell = new PdfPCell();
        cell.setColspan(1);
        cell.addElement(new Phrase("2."));
        table2.addCell(cell);
        cell = new PdfPCell();
        cell.setColspan(3);
        cell.addElement(new Phrase("Score Card of previous year"));
        table2.addCell(cell);
        cell = new PdfPCell();
        cell.setColspan(1);
        cell.addElement(new Phrase("3."));
        table2.addCell(cell);
        cell = new PdfPCell();
        cell.setColspan(3);
        cell.addElement(new Phrase("Copy of Leaving Certificate"));
        table2.addCell(cell);
        cell = new PdfPCell(new Phrase("Rules and Regulation",font));
        cell.setColspan(4);
        table2.addCell(cell);
        cell = new PdfPCell(new Paragraph("Ragging is strictly prohibited. The Maharashtra Legislative Council has passed a bill (L C Bill Number ix of 1999) to prohibit ragging in educational institutions in the State of Maharashtra on 7th April 1999. As per this bill - \n" + 
        		"Ragging within or outside of any educational institution is strictly prohibited. \n" + 
        		"Whosoever directly or indirectly commits, participates in, abets or progagates ragging within or outside any educational institution shall on conviction, be punished, as per the rules. \n" + 
        		"Any student convicted of an offence of ragging shall be dismissed from the educational institution and such student shall not be admitted to any other educational institution for a period of five years from the date of order of such dismissal."));
        cell.setColspan(4);
        table2.addCell(cell);
        document.add(table2);
        document.close();
        System.out.println("here");
        response.setContentType("application.pdf");
        File f = new File("first.pdf");
       
        return true;
	}
}
