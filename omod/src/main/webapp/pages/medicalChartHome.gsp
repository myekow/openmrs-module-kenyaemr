<%
	ui.decorateWith("kenyaemr", "standardPage", [ layout: "sidebar" ])
%>

<div id="content-side">
	${ ui.includeFragment("kenyaemr", "widget/panelMenu", [
		heading: "Tasks",
		items: [
			[ iconProvider: "kenyaemr", icon: "buttons/patient_search.png", label: "Search for a Patient", href: ui.pageLink("kenyaemr", "medicalChartSearch") ]
		]
	]) }
</div>

<div id="content-main">
	${ ui.includeFragment("kenyaemr", "patientList", [ id: "recentlyViewedPatients", page: "medicalChartViewPatient", heading: "Recently Viewed Patients" ]) }
</div>


<script type="text/javascript">
	getJsonAsEvent(ui.fragmentActionLink('kenyaemr', 'medicalChartUtil', 'recentlyViewed'), 'recentlyViewedPatients/show');
</script>