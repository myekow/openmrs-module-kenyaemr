<%
	ui.decorateWith("kenyaemr", "standardPage", [ patient: patient ])

	def hivEnrollmentExtraCallback = { patientProgram ->
		ui.includeFragment("kenyaemr", "dataPoint", [ label: "Enrollment WHO Stage", value: whoStagesAtEnrollments[patientProgram] ])
	}
%>

<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr>
		<td width="40%" valign="top">
		${ ui.includeFragment("kenyaemr", "patientSummary", [ patient: patient ]) }

		${ ui.includeFragment("kenyaemr", "programSummary", [
			patient: patient,
			program: hivProgram,
			registrationFormUuid: MetadataConstants.HIV_PROGRAM_ENROLLMENT_FORM_UUID,
			exitFormUuid: MetadataConstants.HIV_PROGRAM_DISCONTINUATION_FORM_UUID,
			enrollmentExtra: hivEnrollmentExtraCallback
		]) }

		${ ui.includeFragment("kenyaemr", "programSummary", [
			patient: patient,
			program: tbProgram,
			registrationFormUuid: MetadataConstants.TB_ENROLLMENT_FORM_UUID,
			exitFormUuid: MetadataConstants.TB_COMPLETION_FORM_UUID
		]) }
		</td>
		<td width="60%" valign="top" style="padding-left: 5px">
			${ ui.includeFragment("kenyaemr", "visitMenu", [ patient: patient, visit: visit, allowCheckIn: false, allowCheckOut: true ]) }

			<% if (enrolledInHivProgram) { %>
			${ ui.includeFragment("kenyaemr", "careSummaryHiv", [ patient: patient, complete: false, allowRegimenEdit: (visit != null) ]) }
			<% } %>
			<% if (enrolledInTbProgram) { %>
			${ ui.includeFragment("kenyaemr", "careSummaryTb", [ patient: patient, complete: false, allowRegimenEdit: (visit != null) ]) }
			<% } %>

			<% if (visit) { %>
			${ ui.includeFragment("kenyaemr", "visitAvailableForms", [ visit: visit ]) }
			${ ui.includeFragment("kenyaemr", "visitCompletedForms", [ visit: visit ]) }
			<% } %>
		</td>
	</tr>
</table>

<% if (visit) { %>
	${ ui.includeFragment("kenyaemr", "showHtmlForm", [ id: "showHtmlForm", style: "display: none" ]) }
	${ ui.includeFragment("kenyaemr", "dialogSupport") }
<% } %>