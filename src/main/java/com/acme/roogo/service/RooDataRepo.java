package com.acme.roogo.service;

import java.util.List;

import com.acme.roogo.dto.view.ViewFieldDto;

public interface RooDataRepo {


	/**
	 * get the choosable roo field types for the view drop down list
	 * data source: RooFieldTypeEnum or roo XML
	 * @return
	 */
	List<String> getRooFieldTypes();
	

	/**
	 * get the choosable switches for the given field roo type in the view drop down list
	 * data source: roo XML file
	 * @param rooFieldType
	 * @return
	 */
	List<ViewFieldDto> getFieldSwitchList( String rooFieldType );

	/**
	 * data source: enum or roo xml
	 * @return
	 */
	List<String> getJpaDatabaseTypes();

	List<String> getJpaProviderTypes();
	
	List<String> getPackagingTypes();

}
