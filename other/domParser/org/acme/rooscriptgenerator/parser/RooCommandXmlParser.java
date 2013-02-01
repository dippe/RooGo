package org.acme.rooscriptgenerator.parser;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class RooCommandXmlParser {
	Document doc;
	
	public RooCommandXmlParser(String path) throws IOException {
		try {
			File xmlFile = new File(path);
			DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder documentBuilder;
			documentBuilder = documentBuilderFactory.newDocumentBuilder();
			doc = documentBuilder.parse(xmlFile);
		} catch (ParserConfigurationException e) {
			throw new RuntimeException("Parserconfig exception.", e);
		} catch (SAXException e) {
			throw new RuntimeException("Invalid xml file.", e);
		}
	}
	
	public List<String> getNodesByXpath(String expressionStr) {
		List<String> ret = new ArrayList<String>();
		try {
			XPathFactory factory = XPathFactory.newInstance();
			XPath xpath = factory.newXPath();
			XPathExpression expression = xpath.compile(expressionStr);
			NodeList nodes = (NodeList) expression.evaluate(doc, XPathConstants.NODESET);
			for (int i = 0; i < nodes.getLength(); i++) {
				ret.add(nodes.item(i).getTextContent());
			}
		} catch (XPathExpressionException e) {
			throw new RuntimeException("Invalid xpath provided!", e);
		}
		return ret;
	}
}
