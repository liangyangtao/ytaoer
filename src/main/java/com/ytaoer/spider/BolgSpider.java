package com.ytaoer.spider;

import java.util.Date;
import java.util.GregorianCalendar;

import org.jsoup.nodes.Attribute;
import org.jsoup.nodes.Attributes;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.ytaoer.util.Fetcher;

public class BolgSpider {

	// public static int index = 0;

	public static void main(String[] args) {
		String urls[] = {
				"http://baby.qq.com/l/pregnancy/list201407291756.htm@@@怀孕手册@@@怀孕",
				"http://baby.qq.com/l/yingjiang/list201407291735.htm@@@营养学校@@@营养",
				"http://baby.qq.com/l/jiankang/list201407291839.htm@@@健康护理@@@育儿",
				"http://baby.qq.com/l/xuexiao/list201407291429.htm@@@成长阶梯@@@成长" };
		for (String url : urls) {
			String[] temp = url.split("@@@");

			Document document = Fetcher.getInstance().getDoument(temp[0]);
			Elements lis = document.select("#piclist").first().select("li");
			/* for (int i = 0;;) { */
			Element element = lis.get(0);
			Elements picElements = element.select(".picText");
			if (picElements.size() > 0) {
				Element imgElements = picElements.first().select("a > img")
						.first();
				String imgSrc = imgElements.attr("src");
				Element element2 = picElements.first().select("p > a").first();
				String href = element2.absUrl("href");
				// http://baby.qq.com/a/20160919/018259_all.htm
				Document contentDocument = Fetcher.getInstance().getDoument(
						href);
				Elements bodyElements = contentDocument
						.select("#C-Main-Article-QQ");

				if (bodyElements.size() != 0
						&& bodyElements.first().toString().contains("显示全文")) {
					href = href.replace(".htm", "_all.htm");
					contentDocument = Fetcher.getInstance().getDoument(href);
					bodyElements = contentDocument.select("#C-Main-Article-QQ");
				}
				System.out.println(href);
				Element titleElement = bodyElements.first().select(".hd > h1")
						.first();
				Element textElement = bodyElements.first()
						.select("#Cnt-Main-Article-QQ").first();
				Elements addEle = textElement.select(".titdd-Article");
				if (addEle.size() > 0) {
					addEle.first().remove();
				}
				formatElement(textElement);
				String title = titleElement.text();
				title = title.replace(":", "");
				title = title.replace("：", "");
				title = title.replace("\"", "");
				System.out.println(title);
				String text = textElement.toString();
				if (textElement.text().length() < 32) {
					System.out.println("cccc" + href);
					continue;
				} else {
					String description = textElement.text().substring(0, 32);
					description = description.replace(":", "");
					description = description.replace("：", "");
					description = description.replace("\"", "");
					formatText(title, text, description, imgSrc, temp[1],
							temp[2]);
				}
			}

		}

		// }

	}

	private static void formatElement(Element textElement) {
		removeElementAttr(textElement);
		Elements childElements = textElement.children();
		for (Element element : childElements) {
			formatElement(element);
		}

	}

	public static String formatText(String title, String text,
			String description, String imgSrc, String category, String tags) {
		Date time = getyyyyMMddTimeString(0);
		String author = "婴淘社区";
		new BolgStore().saveBlog(category, tags, title, description, author,
				text, time, imgSrc);

		return text;
	}

	public static void removeElementAttr(Element element) {
		if (element == null) {
			return;
		}
		Attributes attributes = element.attributes();
		for (Attribute attribute : attributes) {
			if (attribute.getKey().isEmpty()) {
				continue;
			} else if (attribute.getKey().equals("align")
					&& attribute.getValue().equals("center")) {
				continue;
			} else if (attribute.getKey().equals("style")
					&& (attribute.getValue().toLowerCase()
							.contains("text-align: center"))) {
				continue;
			} else if (attribute.getKey().equals("rowspan")
					|| attribute.getKey().equals("colspan")
					|| attribute.getKey().equals("src")
					|| attribute.getKey().equals("data-src")) {
				continue;
			} else {
				element.removeAttr(attribute.getKey());
			}
		}
	}

	// public static void write(String text, String fileName) {
	// try {
	//
	// FileOutputStream fos = new FileOutputStream(
	// "C:/Users/Administrator/Desktop/blog/" + fileName);
	// OutputStreamWriter osw = new OutputStreamWriter(fos);
	// BufferedWriter bw = new BufferedWriter(osw);
	// bw.write(text);
	// bw.flush();
	// fos.close();
	// osw.close();
	// bw.close();
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	//
	// }

	private static Date getyyyyMMddTimeString(int num) {
		GregorianCalendar calendar = new GregorianCalendar();
		calendar.add(GregorianCalendar.DATE, num);
		Date date = calendar.getTime();
		// SimpleDateFormat simpleDateFormat = new
		// SimpleDateFormat("yyyy-MM-dd");
		// String today = simpleDateFormat.format(date);
		// return today;
		return date;
	}

}
