/**
 * The contents of this file are subject to the OpenMRS Public License
 * Version 1.0 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://license.openmrs.org
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
 * License for the specific language governing rights and limitations
 * under the License.
 *
 * Copyright (C) OpenMRS, LLC.  All Rights Reserved.
 */

package org.openmrs.module.kenyaemr.page.controller;

import java.util.ArrayList;
import java.util.List;

import org.openmrs.module.appframework.AppUiUtil;
import org.openmrs.module.kenyaemr.report.ReportBuilder;
import org.openmrs.module.kenyaemr.report.ReportManager;
import org.openmrs.ui.framework.SimpleObject;
import org.openmrs.ui.framework.page.PageModel;
import org.openmrs.ui.framework.session.Session;

/**
 * Homepage for the "Reports" app
 */
public class ReportsHomePageController {

	public void controller(Session session, PageModel model) {
		AppUiUtil.startApp("kenyaemr.reports", session);
		
		model.addAttribute("mohReports", getReportDefinitionSummaries("moh"));
		model.addAttribute("facilityReports", getReportDefinitionSummaries("facility"));
	}

	/**
	 * Fetches all definition summaries for reports with a given tag
	 * @param tag the report tag
	 * @return the definition summaries
	 */
    private List<SimpleObject> getReportDefinitionSummaries(String tag) {
    	List<SimpleObject> ret = new ArrayList<SimpleObject>();
		for (ReportBuilder reportBuilder : ReportManager.getReportBuildersByTag(tag)) {
			ret.add(SimpleObject.create("name", reportBuilder.getReportDefinitionSummary().getName(), "manager", reportBuilder.getClass().getName()));
		}
		return ret;
    }
}