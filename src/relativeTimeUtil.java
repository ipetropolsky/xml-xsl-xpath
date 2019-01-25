import com.sun.jdi.request.DuplicateRequestException;
import org.w3c.dom.Document;

import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.temporal.Temporal;
import java.util.Date;

public class relativeTimeUtil {

    public static final String sourceFilePath = "homework\\PullRequests.xml";
    public static final String destFilePath = "homework\\input.xml";
    public static final File sourceFile = new File(sourceFilePath);
    public static final File destFile = new File(destFilePath);
    public static LocalDateTime currentDate = LocalDateTime.now();


    public static void main(String[] args) throws Exception{
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document = builder.parse(sourceFile);
        NodeList dateNodes = document.getDocumentElement().getElementsByTagName("date");
        for(int i= 0;i< dateNodes.getLength();i++)
        {
            String time = dateNodes.item(i).getFirstChild().getNodeValue();
            String relativeTime = convertTime(time);
            dateNodes.item(i).getFirstChild().setNodeValue(relativeTime);
        }

        Transformer transformer = TransformerFactory.newInstance().newTransformer();
        DOMSource source = new DOMSource(document);
        StreamResult result = new StreamResult(destFile);
        transformer.transform(source, result);
    }


    public static String convertTime(String str) throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy hh:mm");
        Date date = dateFormat.parse(str);
        LocalDateTime localDate = LocalDateTime.of(date.getYear()+1900,date.getMonth()+1,date.getDate(),date.getHours(),date.getMinutes());
        Duration duration = Duration.between(localDate,currentDate);
        long days = duration.toDays();
        if((days/365)>0){
            return new String((days/365)+" years ago");
        }
        if((days/30)>0){
            return new String((days/30)+" month ago");
        }
        if(days>0){
            return new String(days+" days ago");
        }
        if(duration.toHours()>0){
            return new String(duration.toDays()+" hours ago");
        }
        if(duration.toMinutes()>0){
            return new String(duration.toDays()+" minutes ago");
        }
        else return "recently";


    }

}
