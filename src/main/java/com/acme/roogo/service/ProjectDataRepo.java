package com.acme.roogo.service;

import java.util.List;

import com.acme.roogo.domain.RooGoUser;
import com.acme.roogo.dto.view.ViewEntityDto;
import com.acme.roogo.dto.view.ViewEntityWithFieldDto;
import com.acme.roogo.dto.view.ViewProjectDto;

/**
 * This service will serve the view controller
 * @author Peter_Dajka
 *
 */
public interface ProjectDataRepo {

	List<ViewProjectDto> getViewProjects( RooGoUser user );
	
	List<ViewEntityWithFieldDto> getViewEntitesWithFields();
	
	List<ViewEntityDto> getViewEntities();
	
}
