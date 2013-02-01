package org.acme.rooscriptgenerator.parser;

import java.io.IOException;
import java.util.List;

public class EntryPoint {

	/**
	 * @param args
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException {
		new EntryPoint();
	}
	
	public EntryPoint() throws IOException {
		Runtime runtime = Runtime.getRuntime();
		long before = runtime.freeMemory();
		long start = System.currentTimeMillis();
		
		
		RooCommandXmlParser parser = new RooCommandXmlParser("resources/appendix-command-index.xml");
		List<String> nodes = parser.getNodesByXpath("//section[@id='command-index-jpa-commands']/section/variablelist/varlistentry/term");
		
		
		System.out.format("The method took %d mills to run%n", System.currentTimeMillis() - start);
		long consuption = (before - runtime.freeMemory())/1024;
		System.out.format("It consumes %d KBytes(%d MBytes) memory%n", consuption, consuption/1024);
		for (String nodeVal : nodes) {
			System.out.println("node: " + nodeVal);
		}
	}

}
